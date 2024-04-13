import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Constants/colors.dart';

class TerminalDrawer extends StatelessWidget {
  const TerminalDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/images/logo.svg',
                        height: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('DevSync',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: CustomColors.primaryColor,
                                    fontSize: 28,
                                  )),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //User Details(just username and profile icon) along with its plan details at bottom
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: CustomColors.primaryColor,
                        child: Icon(Icons.person,
                            color: CustomColors.backgroundColor, size: 35),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('vasusomani',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: CustomColors.textColor1,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                          Text('Free Plan',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: CustomColors.textColor2,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.settings,
                          color: CustomColors.textColor1, size: 28),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.add,
                            color: CustomColors.textColor1, size: 28),
                        Text(' New Terminal',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: CustomColors.textColor1,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildTerminalSession(
                      terminalSessionName: 'Terminal 1',
                      terminalSessionStatus: 'Active',
                      terminalDirectory: 'vasusomani',
                      timeLeft: "10m",
                      context: context),
                  const SizedBox(height: 10),
                  _buildTerminalSession(
                      terminalSessionName: 'Terminal 2',
                      terminalSessionStatus: 'Active',
                      terminalDirectory: 'downloads',
                      timeLeft: "02m",
                      context: context),
                  const SizedBox(height: 10),
                  _buildTerminalSession(
                      terminalSessionName: 'Terminal 3',
                      terminalSessionStatus: 'Inactive',
                      terminalDirectory: 'devsync',
                      timeLeft: "05m",
                      context: context),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: CustomColors.gold,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star,
                            color: CustomColors.backgroundColor, size: 28),
                        const SizedBox(width: 10),
                        Text('Upgrade Plan',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: CustomColors.backgroundColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7),
          ],
        ),
      ),
    );
  }

  _buildTerminalSession(
      {required String terminalSessionName,
      required String terminalSessionStatus,
      required String terminalDirectory,
      required String timeLeft,
      required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: CustomColors.backgroundColor2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(terminalSessionName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: CustomColors.textColor1)),
              Text(terminalSessionStatus,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: CustomColors.textColor1)),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 15,
              ),
              const Icon(Icons.folder,
                  color: CustomColors.textColor2, size: 17),
              const SizedBox(width: 7),
              Text('./$terminalDirectory',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: CustomColors.textColor2,
                        fontSize: 16,
                      )),
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                decoration: BoxDecoration(
                  color: CustomColors.alertColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text('$timeLeft left',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: CustomColors.backgroundColor, fontSize: 8)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
