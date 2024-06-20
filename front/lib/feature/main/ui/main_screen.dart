import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/application/di/init_di.dart';
import 'package:front/application/theme.dart';
import 'package:front/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:front/feature/chat/ui/chat_screen.dart';
import 'package:front/feature/main/domain/blocs/home/home_bloc.dart';
import 'package:front/feature/main/domain/entities/room_entity/room_entity.dart';
import 'package:front/feature/main/domain/room_repository.dart';
import 'package:front/utils/widgets/shimer_loading.dart';
import 'package:front/utils/widgets/split_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(locator.get<RoomRepository>())
        ..add(const HomeEvent.started()),
      child: _MainScreenContent(),
    );
  }
}

class _MainScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplitView.material(
      placeholder: _buildPlaceholder(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Rooms'),
        ),
        body: Shimmer(
          linearGradient: GoFlutterChatTheme.shimmerGradient,
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              state.whenOrNull(
                joinRoom: (webSocketChannel, user, room) {
                  SplitView.of(context).setSecondary(ChatScreen(
                      args: ChatScreenArgs(room, user, webSocketChannel)));
                  // GoRouter.of(context).push('/main/chat',
                  //     extra: ChatScreenArgs(room, user, webSocketChannel));
                },
              );
            },
            buildWhen: (previous, current) =>
                current.whenOrNull(
                  joinRoom: (webSocketChannel, user, room) {
                    return false;
                  },
                ) ??
                true,
            builder: (context, state) {
              List<RoomEntity>? rooms;
              state.whenOrNull(
                success: (room) {
                  rooms = room;
                },
              );
              return _buildBody(context, rooms);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return const Scaffold(
      appBar: null,
      body: Center(
        child: Text('Just click on room'),
      ),
    );
  }

  Widget _buildBody(BuildContext context, List<RoomEntity>? rooms) {
    final isLoading = rooms == null;
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        return BlocProvider.of<HomeBloc>(context).add(
          const HomeEvent.refresh(),
        );
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                _buildName(),
                const SizedBox(height: 30),
                ShimmerLoading(
                  isLoading: isLoading,
                  child: _buildAddRoomButton(context, isLoading),
                ),
                rooms != null && rooms.isEmpty
                    ? _buildEmptyContent()
                    : Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Wrap(
                              spacing: 15,
                              alignment: WrapAlignment.start,
                              runAlignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: rooms != null
                                  ? rooms
                                      .map((e) => _buildRoom(e, context))
                                      .toList()
                                  : _buildEmptyList(context),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildName() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final user = state.whenOrNull(
          authorized: (userEntity) => userEntity,
        );

        final name = user?.name;

        return ShimmerLoading(
          isLoading: name == null,
          child: Text(
            'Hi, $name!',
            style: GoFlutterChatTheme.roomsUserNameTextStyle,
          ),
        );
      },
    );
  }

  List<Widget> _buildEmptyList(BuildContext context) {
    return [
      _buildRoom(null, context),
      _buildRoom(null, context),
      _buildRoom(null, context),
    ];
  }

  Widget _buildRoom(RoomEntity? room, BuildContext context) {
    final isLoading = room == null;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ShimmerLoading(
        isLoading: isLoading,
        child: InkWell(
          onTap: () {
            if (room != null) {
              final user = context.authCubit.state.whenOrNull(
                authorized: (userEntity) => userEntity,
              );

              if (user != null) {
                BlocProvider.of<HomeBloc>(context).add(
                  HomeEvent.roomJoinden(user, room),
                );
              }
            }
          },
          child: Container(
            width: isLoading ? 50 : null,
            height: isLoading ? 30 : null,
            decoration: BoxDecoration(
              color: GoFlutterChatTheme.roomItemColor,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsetsDirectional.all(8),
            child: Text(
              room?.name ?? '',
              style: GoFlutterChatTheme.roomNameTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddRoomButton(BuildContext context, bool isLoading) {
    return TextButton(
      onPressed: () async {
        if (!isLoading) {
          final bloc = BlocProvider.of<HomeBloc>(context);
          final res = await showDialog<String>(
              context: context,
              builder: (context) {
                final controller = TextEditingController();

                return AlertDialog(
                  title: const Text('Add room'),
                  content: TextField(
                    controller: controller,
                  ),
                  actions: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text('Add'),
                      onPressed: () {
                        final text = controller.text.trim();
                        final length = text.length;
                        if (length > 2 && length < 11) {
                          Navigator.of(context).pop(text);
                        }
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
          if (res != null) {
            bloc.add(
              HomeEvent.roomCreated(res),
            );
          }
        }
      },
      child: const Text(
        'Add room',
      ),
    );
  }

  Widget _buildEmptyContent() {
    return const Center(child: Text('There is not a single room'));
  }
}
