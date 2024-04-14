import 'package:devsync/model/session_model.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class TerminalService {
  final String token;
  final String address;

  TerminalService({required this.token, required this.address}) {
    String webSocketUrl = 'ws://$address/connect-session';
    debugPrint(webSocketUrl.toString());
    final uri = Uri.parse("$webSocketUrl?token=${Uri.encodeComponent(token)}");
    debugPrint(uri.toString());
    WebSocketChannel channel = WebSocketChannel.connect(uri);

    channel.stream.listen(
      (data) {
        SessionModel sessionData = SessionModel.fromJson(data);
      },
      onError: (error) =>
          debugPrint("Error in WebSocket Connection: ${error.toString()}"),
    );
  }
}
