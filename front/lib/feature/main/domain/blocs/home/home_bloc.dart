import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/feature/main/domain/entities/room_entity/room_entity.dart';
import 'package:front/feature/main/domain/room_repository.dart';
import 'package:front/utils/error_variable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:front/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:front/utils/extentions/event_to_state_extention.dart';
import 'package:front/utils/assert_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RoomRepository roomRepository;
  HomeBloc(this.roomRepository) : super(HomeState.initial()) {
    onBlocEvent((event) => _eventToState(event));
  }

  Stream<HomeState> _eventToState(HomeEvent event) async* {
    if (event is _Started) {
      yield* _mapShownToState(event);
    } else if (event is _RoomCreated) {
      yield* _mapRoomCreatedToState(event);
    } else if (event is _Refresh) {
      yield* _mapRefreshToState(event);
    } else if (event is _RoomJoined) {
      yield* _mapJoinedToState(event);
    } else {
      assertUnhandledEvent(event);
    }
  }

  Stream<HomeState> _mapJoinedToState(_RoomJoined event) async* {
    try {
      final channel = await roomRepository.joinRoom(
          room: event.roomEntity, userEntity: event.userEntity);
      print(channel);
      print(channel);

      yield HomeState.joinRoom(channel, event.userEntity, event.roomEntity);
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Stream<HomeState> _mapRefreshToState(_Refresh event) async* {
    yield* _toSuccessState();
  }

  Stream<HomeState> _mapShownToState(_Started event) async* {
    yield* _toSuccessState();
  }

  Stream<HomeState> _toSuccessState() async* {
    yield _LoadInProgress();
    try {
      final rooms = await roomRepository.getRooms();
      // await Future.delayed(Duration(seconds: 10));
      yield _Success(rooms);
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Stream<HomeState> _mapRoomCreatedToState(_RoomCreated event) async* {
    try {
      await roomRepository.createRoom(name: event.name);
      yield* _toSuccessState();
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    if (isServerEternalError(error)) {
      super.addError(error, stackTrace);
    } else {
      // emit(AuthState.error(error));
      super.addError(error, stackTrace);
    }
  }
}
