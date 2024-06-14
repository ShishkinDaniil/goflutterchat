import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:front/feature/chat/data/dto/message_dto.dart';
import 'package:front/feature/chat/domain/entities/message/message.dart';
import 'package:front/feature/main/domain/entities/room_entity/room_entity.dart';
import 'package:front/feature/main/domain/room_repository.dart';
import 'package:front/utils/assert_bloc.dart';
import 'package:front/utils/extentions/event_to_state_extention.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'chat_screen_event.dart';
part 'chat_screen_state.dart';

class ChatScreenBloc extends Bloc<ChatScreenEvent, ChatScreenState> {
  final RoomRepository roomRepository;
  final RoomEntity room;
  final UserEntity user;
  final List<Message> _messages = [];

  final WebSocketChannel webSoketChannel;
  late StreamSubscription<dynamic> _streamSubscription;
  ChatScreenBloc(
    this.roomRepository,
    this.room,
    this.user,
    this.webSoketChannel,
  ) : super(ChatScreenInitial()) {
    onBlocEvent((event) => _eventToState(event));

    _streamSubscription = webSoketChannel.stream.listen((event) {
      _messages
          .add(MessageDto.fromJson(json.decode(event)).toMessage(user.chatId));

      add(ChatScreenChanged());
    }, onDone: () {
      //  yield ChatScreenDone();
    }, onError: (err) {
      // yield ChatScreenError();
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    webSoketChannel.sink.close();
    return super.close();
  }

  Stream<ChatScreenState> _eventToState(ChatScreenEvent event) async* {
    if (event is ChatScreenShown) {
      yield* _mapShownToState(event);
    } else if (event is ChatScreenAddMessage) {
      yield* _mapAddToState(event);
    } else if (event is ChatScreenChanged) {
      yield* _mapChangedToState(event);
    } else {
      assertUnhandledEvent(event);
    }
  }

  Stream<ChatScreenState> _mapChangedToState(ChatScreenChanged event) async* {
    yield ChatScreenUpdated();
    yield* _toSuccessState();
  }

  Stream<ChatScreenState> _mapAddToState(ChatScreenAddMessage event) async* {
    try {
      webSoketChannel.sink.add(event.message);
    } catch (err) {
      yield ChatScreenError();
    }
  }

  Stream<ChatScreenState> _mapShownToState(ChatScreenShown event) async* {
    yield* _toSuccessState();
  }

  Stream<ChatScreenState> _toSuccessState() async* {
    yield ChatScreenLoadSuccess(_messages);
  }
}
