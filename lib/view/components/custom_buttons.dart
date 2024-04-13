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
        backgroundColor: CustomColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: (isLoading)
              ? FittedBox(
                  child: const CircularProgressIndicator(color: Colors.white))
              : Text(text, style: Theme.of(context).textTheme.labelMedium)),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: CustomColors.primaryColor)),
      ),
    );
  }
}

class TertiaryButton extends StatelessWidget {
  const TertiaryButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.suffix,
      this.isLoading = false});
  final VoidCallback onPressed;
  final String text;
  final Widget? suffix;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: (isLoading)
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                    strokeWidth: 3, color: CustomColors.backgroundColor),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: CustomColors.backgroundColor)),
                  if (suffix != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: suffix!,
                    ),
                ],
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
                borderRadius: BorderRadius.circular(10))),
            elevation: const MaterialStatePropertyAll(2),
            backgroundColor:
                const MaterialStatePropertyAll(CustomColors.textFieldColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
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
