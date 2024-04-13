import 'package:devsync/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/drawers/terminal_drawer.dart';

class TerminalScreen extends StatefulWidget {
  const TerminalScreen({super.key});

  @override
  State<TerminalScreen> createState() => _TerminalScreenState();
}

class _TerminalScreenState extends State<TerminalScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final String _command =
      'git clone https://github.com/Walnut-HealthTech/Walnut-Mobile-App.git';
  final String _output = '''Cloning into 'Walnut-Mobile-App'...
  remote: Enumerating objects: 20214, done.
  remote: Counting objects: 100% (20214/20214), done.
  remote: Compressing objects: 100% (5606/5606), done.
  remote: Total 20214 (delta 14213), reused 19943 (delta 14006), pack-reused 0
  Receiving objects: 100% (20214/20214), 214.23 MiB | 4.47 MiB/s, done.
  Resolving deltas: 100% (14213/14213), done.''';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("\$ ${_command}",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: CustomColors.primaryColor, wordSpacing: -5)),
            SizedBox(height: 5),
            Text(
              _output,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: CustomColors.textColor1,
                    fontSize: 13,
                    wordSpacing: -5,
                  ),
            ),
          ],
        ),
      ),
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
