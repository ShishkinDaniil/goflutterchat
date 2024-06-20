import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/application/di/init_di.dart';
import 'package:front/application/theme.dart';
import 'package:front/application/ui/app_loader.dart';
import 'package:front/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:front/feature/chat/domain/blocs/chat_screen.dart/chat_screen_bloc.dart';
import 'package:front/feature/chat/domain/entities/message/message.dart';
import 'package:front/feature/main/domain/entities/room_entity/room_entity.dart';
import 'package:front/feature/main/domain/room_repository.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatScreen extends StatelessWidget {
  final ChatScreenArgs args;

  const ChatScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatScreenBloc(
        locator.get<RoomRepository>(),
        args.room,
        args.userEntity,
        args.webSocketChannel,
      )..add(const ChatScreenShown()),
      child: _ChatScreenContent(args: args),
    );
  }
}

class _ChatScreenContent extends StatefulWidget {
  final ChatScreenArgs args;

  const _ChatScreenContent({
    required this.args,
  });

  @override
  State<_ChatScreenContent> createState() => _ChatScreenContentState();
}

class _ChatScreenContentState extends State<_ChatScreenContent> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final args = widget.args;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(args.room.name),
        ),
        body: BlocBuilder<ChatScreenBloc, ChatScreenState>(
          buildWhen: (previous, current) => current is! ChatScreenUpdated,
          builder: (context, state) {
            if (state is ChatScreenLoadSuccess) {
              return _buildBody(state);
            } else if (state is ChatScreenError) {
              _buildError();
            }

            return const AppLoader();
          },
        ),
      ),
    );
  }

  Widget _buildError() {
    return const Center(
      child: Text("Error"),
    );
  }

  Widget _buildBody(ChatScreenLoadSuccess state) {
    final messages = state.messages;
    return Column(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _MessageItem(
                  message: messages[index],
                );
              },
            ),
          ),
        ),
        const Divider(
          thickness: 5,
          height: 5,
        ),
        _buildInputItem(),
      ],
    );
  }

  Widget _buildInputItem() {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 10,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            alignment: Alignment.center,
            iconSize: 48,
            icon: const Icon(
              CupertinoIcons.add_circled_solid,
              color: Colors.amber,
              size: 48,
            ),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                BlocProvider.of<ChatScreenBloc>(context)
                    .add(ChatScreenAddMessage(_controller.text));
                _controller.text = '';
              }
            },
          )
        ],
      ),
    );
  }
}

class ChatScreenArgs {
  final RoomEntity room;
  final UserEntity userEntity;
  final WebSocketChannel webSocketChannel;

  ChatScreenArgs(
    this.room,
    this.userEntity,
    this.webSocketChannel,
  );

  @override
  String toString() {
    return 'ChatScreenArgs{room: $room, userEntity: $userEntity, webSocketChannel: $webSocketChannel}';
  }
}

class _MessageItem extends StatelessWidget {
  final Message message;
  const _MessageItem({
    required this.message,
  });

  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    switch (message.type) {
      case MsgType.def:
        return _buildDefMessage(message);
      case MsgType.recv:
        return _buildResMessage(message);
      case MsgType.self:
        return _buildSelfMessage(message);
    }
  }

  Widget _buildSelfMessage(Message message) {
    return _buildBaseMessage(
      message: message,
      backColor: GoFlutterChatTheme.roomItemColor,
      alignment: AlignmentDirectional.centerEnd,
      borederRadius: const BorderRadiusDirectional.only(
        bottomEnd: Radius.circular(_borderRadius),
        bottomStart: Radius.circular(_borderRadius),
        topStart: Radius.circular(_borderRadius),
      ),
    );
  }

  Widget _buildResMessage(Message message) {
    return _buildBaseMessage(
      message: message,
      backColor: GoFlutterChatTheme.roomItemColor.withOpacity(0.5),
      nameReq: true,
      alignment: AlignmentDirectional.centerStart,
      borederRadius: const BorderRadiusDirectional.only(
        bottomEnd: Radius.circular(_borderRadius),
        bottomStart: Radius.circular(_borderRadius),
        topEnd: Radius.circular(_borderRadius),
      ),
    );
  }

  Widget _buildDefMessage(Message message) {
    return _buildBaseMessage(
      message: message,
      backColor: Colors.grey.withOpacity(0.5),
      alignment: AlignmentDirectional.center,
      borederRadius: const BorderRadiusDirectional.only(
        bottomEnd: Radius.circular(_borderRadius),
        bottomStart: Radius.circular(_borderRadius),
        topEnd: Radius.circular(_borderRadius),
        topStart: Radius.circular(_borderRadius),
      ),
    );
  }

  Widget _buildBaseMessage({
    required Message message,
    required Color backColor,
    required AlignmentDirectional alignment,
    required BorderRadiusDirectional borederRadius,
    bool nameReq = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Align(
        alignment: alignment,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (nameReq)
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 4),
                child: Text(
                  message.username,
                ),
              ),
            Container(
              decoration:
                  BoxDecoration(color: backColor, borderRadius: borederRadius),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
                child: Text(
                  message.content,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
