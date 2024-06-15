## Flutter GO Realtime Chat
![](assets/Untitled.gif)
The idea was taken from https://github.com/dhij/go-next-ts_chat, partially ported to Flutter (3.16.5), but the mechanism of working with tokens is a bit modified.
Handshake doesn't work in the web version, I plan to do it in the future.
Also logout is not implemented (in the current version of the prototype I don't see the sense to implement manipulations with profile).
The frontend uses BLoC Cubit, go_router, dio, freezed, web_socket_channel, hydrated_bloc.
