import 'dart:async';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/helpers/websocket_helper.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// WebSocket APIs
class WebSockets {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;

  bool init() {
    try {
      // Initialize the WebSocket connection
      State.webSocketServer =
          WebSocketChannel.connect(Uri.parse(State.webSocketEndpoint!));
      State.webSocketHelper = WebSocketHelper(State.webSocketServer);

      // Broadcasting a message every 10 seconds
      Timer.periodic(Duration(seconds: 10), (timer) {
        State.webSocketServer.sink.add('Hello again from server');
      });
    } catch (e) {
      print('Error initializing WebSocket: $e');
      return false;
    }

    return true;
  }

  // Send a message through the WebSocket
  void sendMessage(String message) {
    if (State.webSocketServer != null) {
      State.webSocketServer!.add(message);
    } else {
      print("WebSocket server is not initialized.");
    }
  }
}
