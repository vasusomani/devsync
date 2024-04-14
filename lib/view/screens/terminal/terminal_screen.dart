import 'dart:convert';
import 'dart:developer';

import 'package:devsync/Constants/colors.dart';
import 'package:devsync/model/user_model.dart';
import 'package:devsync/services/local_storage_services/helper_functions/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../model/session_model.dart';
import '../../../services/state_management_services/user_riverpod.dart';
import '../../components/drawers/terminal_drawer.dart';

class TerminalScreen extends ConsumerStatefulWidget {
  const TerminalScreen({super.key, required this.address});
  final String address;

  @override
  ConsumerState<TerminalScreen> createState() => _TerminalScreenState();
}

class _TerminalScreenState extends ConsumerState<TerminalScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final List<Map<String, dynamic>> _output = [];
  late SessionModel sessionData;
  late WebSocketChannel channel;
  TextEditingController commandController = TextEditingController();

  @override
  void initState() {
    String webSocketUrl = 'ws://${widget.address}/connect-session';
    debugPrint(webSocketUrl.toString());
    UserModel? user = ref.read(userProvider);
    final uri =
        Uri.parse("$webSocketUrl?token=${Uri.encodeComponent(user!.token!)}");
    debugPrint(uri.toString());
    channel = WebSocketChannel.connect(uri);
    channel.stream.listen(
      (data) {
        debugPrint(data.toString());
        final session = jsonDecode(data);
        debugPrint("SESSION DATA" + session.toString());
        if (session['type'] == 'welcome') {
          sessionData = SessionModel.fromJson(session['data']);
        } else if (session['type'] == 'stdout') {
          setState(() {
            _output.add({
              "type": session['type'],
              "output": session['data'],
            });
          });
          log(session['command']);
        } else if (session['type'] == 'stderr') {
          setState(() {
            _output.add({
              "type": session['type'],
              "output": session['data'],
            });
          });
        }
      },
      onError: (error) {
        debugPrint("Error in WebSocket Connection: ${error.toString()}");
        ToastWidgit.bottomToast(
            "Error in WebSocket Connection: ${error.toString()}");
      },
      onDone: () {
        debugPrint("WebSocket Connection Closed");
      },
    );

    super.initState();
  }

  sendCommand(Map<String, dynamic> command) {
    channel.sink.add(
      jsonEncode(
        {
          "type": command['type'],
          "data": {
            "sessionId": sessionData.id,
            "baseDirectory": '/',
            "command": command['command']
          }
        },
      ),
    );
    setState(() {
      _output.add({
        "type": "command",
        "output": command['command'],
      });
      commandController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: const Text('./vasusomani'),
        leadingWidth: 50,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/menu.svg',
            color: CustomColors.textColor1,
            height: 40,
            width: 40,
          ),
          onPressed: () => _key.currentState!.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.folder,
              size: 25,
              color: CustomColors.textColor1,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 30,
              color: CustomColors.textColor1,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 5),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView.builder(
            itemCount: _output.length,
            itemBuilder: (context, index) {
              return _buildTerminalOutput(_output[index]);
            },
          )),
      drawer: const TerminalDrawer(),
      bottomSheet: Container(
        color: CustomColors.backgroundColor2,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: SvgPicture.asset(
                'assets/icons/arrow.svg',
                color: CustomColors.textColor1,
                height: 15,
                width: 15,
              ),
            ),
            Expanded(
              child: TextField(
                controller: commandController,
                cursorColor: CustomColors.textColor1,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: CustomColors.textColor1,
                      wordSpacing: -5,
                    ),
                decoration: InputDecoration(
                  hintText: 'Enter terminal command here',
                  hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: CustomColors.textColor2,
                        wordSpacing: -5,
                      ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/enter.svg',
                color: CustomColors.textColor1,
                height: 20,
                width: 20,
              ),
              onPressed: () => sendCommand({
                'type': 'command',
                'command': commandController.text,
              }),
            ),
          ],
        ),
      ),
    );
  }

  _buildTerminalOutput(Map<String, dynamic> output) {
    debugPrint(output.toString());
    Color color = (output['type'] == 'stdout')
        ? CustomColors.textColor1
        : ((output['type'] == 'stderr')
            ? CustomColors.alertColor
            : CustomColors.primaryColor);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (output['type'] == 'command')
          Text("\$ ${output["output"]}",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: CustomColors.primaryColor, wordSpacing: -5)),
        if (output['type'] != 'command')
          Text(output['output'],
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: color, wordSpacing: -5)),
        SizedBox(height: 5),
      ],
    );
  }
}
