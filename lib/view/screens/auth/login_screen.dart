import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Constants/colors.dart';
import '../../components/custom_buttons.dart';
import '../../components/textfields/auth_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor2,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'DevSync',
                  style: Theme.of(context).textTheme.labelLarge!,
                ),
              ],
            ),
            Stack(
              children: [
                // Container(
                //   height: MediaQuery.of(context).size.height * 0.25,
                //   width: MediaQuery.of(context).size.width,
                //   decoration: ShapeDecoration(
                //     color: CustomColors.backgroundColor,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.only(
                //           // bottomRight: Radius.elliptical(300, 200),
                //           ),
                //     ),
                //   ),
                // ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Text(
                        'Sign In',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  AuthTextField(
                    title: 'Username',
                    controller: usernameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthTextField(
                    title: 'Password',
                    controller: passwordController,
                    inputAction: TextInputAction.done,
                    isObscure: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: CustomColors.textColor1,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: PrimaryButton(
                      text: 'Submit',
                      onPressed: () => Navigator.of(context).pushNamed('/home'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Row(
              children: [
                const Expanded(
                    child: Divider(
                  color: Colors.white,
                  thickness: 1,
                  endIndent: 20,
                  indent: 15,
                )),
                Text(
                  "or",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: CustomColors.textColor1,
                      ),
                  textAlign: TextAlign.center,
                ),
                const Expanded(
                    child: Divider(
                  color: Colors.white,
                  thickness: 1,
                  indent: 20,
                  endIndent: 15,
                )),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: SocialButton(
                onPressed: () {},
                isLogin: true,
                isLoading: false,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //create account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: CustomColors.textColor1,
                      ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    'Create Account',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: CustomColors.primaryColor,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
