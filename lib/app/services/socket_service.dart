import 'package:flutter/material.dart';
import 'package:getx_architecture/app/data_sources/local/cache_manager.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService  with CacheManager {
  static SocketService? _instance;

  SocketService._();

  static SocketService get instance => _instance ??= SocketService._();
  IO.Socket? socket;

  void disconnectSocket() {
    socket?.disconnect();
    socket?.destroy();
    socket?.dispose();
    socket = null;
    debugPrint("Destroyed Socket}");
  }

  initSocket() {
    if (socket == null || "user_access_token" != "") {
      try {
        socket = IO.io(
            'socket_base_url',
            IO.OptionBuilder()
                .setTransports(['websocket']) // for Flutter or Dart VM
                .disableAutoConnect()
                .setPath('/socket_path_url')
                .setQuery({
                  'token': "user_access_token",
                  'isVendor': true,
                  'conversationType': 0 //for Ecom
                }) // optional
                .build());
        socket?.connect();
        socket?.onConnect((data) {
          // print('connect');
          debugPrint("Socket is Connected ${socket?.id}");
        });
        socket?.onConnectError((data) {
          debugPrint("Socket Error ${data.toString()}");
          socket = null;
        });
      } on Exception catch (_, e) {
        debugPrint(e.toString());
        socket = null;
      }
    }
    return socket;
  }
}
