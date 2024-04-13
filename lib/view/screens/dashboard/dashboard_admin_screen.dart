import 'package:devsync/view/components/custom_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Constants/colors.dart';

class DashboardAdminScreen extends StatefulWidget {
  const DashboardAdminScreen({super.key});

  @override
  State<DashboardAdminScreen> createState() => _DashboardAdminScreenState();
}

class _DashboardAdminScreenState extends State<DashboardAdminScreen> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor2,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hii Vasu 👋,",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  // color: CustomColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Join a session to start working",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: CustomColors.textColor2,
                          ),
                      decoration: InputDecoration(
                        hintText: "Enter session address",
                        hintStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: CustomColors.textColor2,
                                ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: CustomColors.textColor2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: CustomColors.textColor1),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.arrow_right,
                            size: 30,
                            color: CustomColors.textColor2,
                          ),
                        ),
                      ),
                    ),
                    //hint, for eg: 172.121.51.6.7
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        "Example: 172.121.51.6.7",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: CustomColors.textColor2,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                    //or create a new session, learn how
                    const SizedBox(height: 40),
                    RichText(
                        text: TextSpan(
                      text: "Set up a new session instantly, ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: "Learn How",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: CustomColors.textColor1,
                                  ),
                        ),
                      ],
                    )),
                    const SizedBox(height: 30),
                    //horizontal line
                    const Divider(
                      color: CustomColors.textColor1,
                      thickness: 1,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "My Sessions",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Column(
                      children: [
                        for (int i = 0; i < 3; i++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: CustomColors.backgroundColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/terminal.svg",
                                        height: 30,
                                        width: 30,
                                        color: CustomColors.primaryColor,
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "121.173.45.1.1",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                          Text(
                                            "Session Address",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.info,
                                          color: CustomColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (isExpanded)
                                    Column(
                                      children: [
                                        const SizedBox(height: 20),
                                        _buildInfoRow(
                                            "Device Name", "Vasu's MAC"),
                                        const SizedBox(height: 10),
                                        _buildInfoRow("Active Users", "7"),
                                        const SizedBox(height: 10),
                                        _buildInfoRow(
                                            "Session Time", "23 mins"),
                                        const SizedBox(height: 10),
                                        _buildInfoRow(
                                            "Session Status", "Active"),
                                        const SizedBox(height: 20),
                                        //red color connect button
                                        SizedBox(
                                          width: double.maxFinite,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: SecondaryButton(
                                                  onPressed: () {},
                                                  text: "View Logs",
                                                ),
                                              ),
                                              const SizedBox(width: 15),
                                              Expanded(
                                                  child: SecondaryButton(
                                                onPressed: () {},
                                                text: "Settings",
                                              )),
                                            ],
                                          ),
                                        ),

                                        SizedBox(
                                          width: double.maxFinite,
                                          child: SecondaryButton(
                                            onPressed: () {},
                                            text: "Connect",
                                            isAlert: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}