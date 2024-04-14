import 'package:devsync/Constants/colors.dart';
import 'package:devsync/model/device_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../components/custom_buttons.dart';

class AdminSettings extends StatefulWidget {
  const AdminSettings({super.key});

  @override
  State<AdminSettings> createState() => _AdminSettingsState();
}

class _AdminSettingsState extends State<AdminSettings> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    String sessionAddress = '127.23.6.1';
    String deviceName = 'Vasu\'s Mac';
    String activeUsers = '5';
    String status = 'Active';
    String timer = '02:30:00';
    String activeTerminals = '7';
    DateTime startedAt = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        automaticallyImplyLeading: true,
        title: const Text('Session Settings'),
      ),
      //Tab bar view of 2 tabs (Info and Users)
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            const TabBar(
              indicatorColor: CustomColors.primaryColor,
              dividerColor: CustomColors.textColor2,
              labelPadding: EdgeInsets.symmetric(vertical: 5),
              indicatorPadding: EdgeInsets.symmetric(horizontal: -10),
              labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: CustomColors.primaryColor,
              ),
              tabs: <Widget>[
                Tab(
                  text: 'Session Info',
                ),
                Tab(
                  text: 'Session User',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  //Session Info tab
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        //Status with status icon
                        _buildInfoRow(
                            const Icon(
                              Icons.circle,
                              size: 28,
                              color: CustomColors.primaryColor,
                            ),
                            "Status",
                            status),
                        //Session Address with icon
                        _buildInfoRow(
                          const Icon(
                            Icons.location_on,
                            color: CustomColors.primaryColor,
                            size: 35,
                          ),
                          'Session Address',
                          sessionAddress,
                        ),
                        //Device Name with laptop icon
                        _buildInfoRow(
                            const Icon(
                              Icons.laptop,
                              size: 32,
                              color: CustomColors.primaryColor,
                            ),
                            "Device Name",
                            deviceName),
                        //Active Users with user icon
                        _buildInfoRow(
                            const Icon(
                              Icons.person,
                              size: 32,
                              color: CustomColors.primaryColor,
                            ),
                            "Active Users",
                            activeUsers),
                        //Active Terminals with terminal svg icon
                        _buildInfoRow(
                            SvgPicture.asset(
                              'assets/icons/terminal.svg',
                              color: CustomColors.primaryColor,
                              height: 32,
                            ),
                            "Active Terminals",
                            activeTerminals),
                        //Timer with clock icon
                        _buildInfoRow(
                            const Icon(
                              Icons.timer,
                              size: 32,
                              color: CustomColors.primaryColor,
                            ),
                            "Timer",
                            timer),
                        //Started At with calendar icon
                        _buildInfoRow(
                            const Icon(
                              Icons.calendar_today,
                              size: 32,
                              color: CustomColors.primaryColor,
                            ),
                            "Started On",
                            DateFormat('dd MMM, yyyy').format(startedAt)),
                      ],
                    ),
                  ),
                  //Session User tab
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        _buildDeviceRow(DeviceModel(
                          deviceName: 'Vasu\'s Mac',
                          deviceAddress: '192.168.1.1',
                          deviceType: 'laptop',
                          deviceStatus: 'Active',
                          deviceTerminals: "2",
                          deviceTimer: '02:30:00',
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //return alert dialog that you want to end the session
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: CustomColors.backgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: const Text('End Session',
                    style: TextStyle(
                      color: CustomColors.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                content: Text(
                    'Are you sure you want to end the session? This will disconnect all the users.',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: CustomColors.textColor1,
                          fontSize: 16,
                        )),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: CustomColors.textColor1,
                              fontSize: 16,
                            )),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'End Session',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: CustomColors.alertColor,
                            fontSize: 17,
                          ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        shape: CircleBorder(),
        child: const Icon(
          Icons.close,
          weight: 2,
          size: 28,
          color: Colors.white,
        ),
        backgroundColor: CustomColors.alertColor,
      ),
    );
  }

  _buildInfoRow(Widget icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: CustomColors.backgroundColor2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: CustomColors.textColor1,
                        fontSize: 18,
                      )),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildDeviceRow(DeviceModel device) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: CustomColors.backgroundColor2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  (device.deviceType == "laptop")
                      ? Icons.laptop
                      : Icons.phone_android,
                  size: 32,
                  color: CustomColors.primaryColor,
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(device.deviceName!,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: CustomColors.textColor1,
                              fontSize: 18,
                            )),
                    Text(
                      device.deviceAddress!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    if (isExpanded)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          _buildRichText('Status: ', device.deviceStatus!),
                          SizedBox(height: 3),
                          _buildRichText('Type: ', device.deviceType!),
                          SizedBox(height: 3),
                          _buildRichText(
                              'Terminals: ', device.deviceTerminals!),
                          SizedBox(height: 3),
                          _buildRichText('Timer: ', device.deviceTimer!),
                          SizedBox(height: 40),
                        ],
                      ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.info,
                  size: 32,
                  color: CustomColors.primaryColor,
                )
              ],
            ),
            if (isExpanded)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SecondaryButton(
                    isContrast: true,
                    text: 'Permissions',
                    onPressed: () {},
                  ),
                  SizedBox(width: 20),
                  SecondaryButton(
                    text: 'End Session',
                    onPressed: () {},
                    isAlert: true,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  _buildRichText(String title, String value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: CustomColors.textColor1,
                  fontSize: 18,
                ),
          ),
          TextSpan(
            text: value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
