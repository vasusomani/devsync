import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isContrast = false,
      this.isLoading = false});
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isContrast;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: CustomColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: (isLoading)
              ? const FittedBox(
                  child: CupertinoActivityIndicator(color: Colors.white))
              : Text(text, style: Theme.of(context).textTheme.labelMedium)),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isAlert = false,
      this.isLoading = false});
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isAlert;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>((isAlert)
            ? CustomColors.alertColor
            : CustomColors.backgroundColor2),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: (isAlert) ? Colors.white : CustomColors.primaryColor,
            ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  SocialButton({
    super.key,
    this.isApple = false,
    this.prefix,
    required this.onPressed,
    this.isLoading = false,
    this.isLogin = false,
  });
  final bool isApple;
  final Icon? prefix;
  final Function()? onPressed;
  final bool isLoading;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45))),
            elevation: const MaterialStatePropertyAll(2),
            backgroundColor:
                const MaterialStatePropertyAll(CustomColors.textFieldColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: (isLoading)
              ? const SizedBox(
                  height: 23,
                  width: 23,
                  child: CircularProgressIndicator(
                      strokeWidth: 3, color: CustomColors.primaryColor),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (prefix != null) prefix!,
                    if (prefix == null)
                      Image.asset(
                          (isApple)
                              ? 'assets/images/apple.png'
                              : 'assets/images/google.png',
                          scale: (isApple) ? 20 : 0.8,
                          color: (isApple) ? Colors.black : null),
                    const SizedBox(width: 20),
                    Flexible(
                      child: Text(
                          "Sign ${isLogin ? "in" : "up"} with ${prefix != null ? "Email and Password" : (isApple) ? "Apple" : "Google"}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: CustomColors.textColor1)),
                    ),
                  ],
                ),
        ));
  }
}
