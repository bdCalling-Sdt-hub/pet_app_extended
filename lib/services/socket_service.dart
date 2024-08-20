import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../utils/App_Urls/app_urls.dart';


class SocketServices {
  static late io.Socket socket;
  bool show = false;


  ///<<<============ Connect with socket ====================>>>
  static void connectToSocket() {
    socket = io.io(
        AppUrls.socketUrl,
        io.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .build());

    socket.onConnect((data) {
      debugPrint("=============================> Connection $data");
    });
    socket.onConnectError((data) {
      if (kDebugMode) {
        print("============================>Connection Error $data");
      }
    });

    socket.connect();

  }
}
