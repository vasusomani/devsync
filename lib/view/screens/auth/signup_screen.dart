import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/colors.dart';
import '../../components/custom_buttons.dart';
import '../../components/textfields/auth_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  height: 60,
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
            const SizedBox(
              height: 30,
            ),
            Text(
              'Sign Up',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: CustomColors.textColor1,
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  AuthTextField(
                    title: 'Username',
                    controller: usernameController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  AuthTextField(
                    title: 'Name',
                    controller: nameController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  AuthTextField(
                    title: 'Email',
                    controller: emailController,
                    isEmail: true,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  AuthTextField(
                    title: 'Password',
                    controller: passwordController,
                    inputAction: TextInputAction.done,
                    isObscure: true,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  AuthTextField(
                    title: 'Confirm Password',
                    controller: confirmPasswordController,
                    inputAction: TextInputAction.done,
                    isObscure: true,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: PrimaryButton(
                      text: 'Submit',
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/dashboard_common'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
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
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: SocialButton(
                onPressed: () {},
                isLogin: false,
                isLoading: false,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //create account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: CustomColors.textColor1,
                      ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
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
