// ignore: depend_on_referenced_packages
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketClient {
  final WebSocketChannel channel;
  final String id;

  WebSocketClient(this.channel, this.id);
}

class WebSocketHelper {
  final WebSocketChannel server;
  final Map<String, WebSocketClient> clients = {};

  WebSocketHelper(this.server) {
    _init();
  }

  void _init() {
    // Listener for when the WebSocket connection opens
    server.stream.listen((message) {
      _onMessage(message);
    }, onDone: _onClose);

    // Send a message when the connection is established
    _send('Hello from client');
  }

  // Handle incoming messages
  void _onMessage(dynamic message) {
    // print('Received from server: $message');
  }

  // Handle connection closure
  void _onClose() {
    // print('Disconnected from WebSocket server');
  }

  // Send a message to the server
  void _send(String message) {
    server.sink.add(message);
  }
}
