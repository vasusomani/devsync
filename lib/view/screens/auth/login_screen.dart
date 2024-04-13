import 'package:devsync/services/local_storage_services/helper_functions/toast_util.dart';
import 'package:devsync/services/state_management_services/user_riverpod.dart';
import 'package:devsync/view/routes/routing_transition.dart';
import 'package:devsync/view/screens/auth/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/colors.dart';
import '../../../model/user_model.dart';
import '../../../services/api_services/auth_api.dart';
import '../../components/custom_buttons.dart';
import '../../components/textfields/auth_textfield.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  login() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      ToastWidgit.bottomToast("Please fill all fields");
      return;
    }
    try {
      setState(() {
        isLoading = true;
      });
      UserModel? user = UserModel(
        username: usernameController.text,
        password: passwordController.text,
      );
      debugPrint("FLAG 1");
      UserModel? newUser = await AuthApi().login(user);
      setState(() {
        isLoading = false;
      });
      debugPrint(newUser!.toJson().toString());
      debugPrint("FLAG 2");
      ref.read(userProvider.notifier).setUser(newUser!);
      Navigator.pushNamed(context, '/dashboard_admin');
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ToastWidgit.bottomToast(e.toString());
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor2,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 30,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
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
            ),
            Stack(
              children: [
                // Container(
                //   height: MediaQuery.of(context).size.height * 0.3,
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
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: CustomColors.textColor1,
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                            ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
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
                      isLoading: isLoading,
                      onPressed: () async => await login(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
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
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: SocialButton(
                onPressed: () {},
                isLogin: false,
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
                  onPressed: () => Navigator.push(context,
                      SlideRoute(page: SignUpScreen(), isRight: false)),
                  child: Text(
                    'Create Account',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: CustomColors.primaryColor,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
