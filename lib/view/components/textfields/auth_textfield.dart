import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';

class AuthTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isObscure;
  final bool isNumber;
  final TextInputAction? inputAction;
  final bool isUsername;
  final bool isEmail;
  final bool isPassword;
  final bool isConfirmPassword;
  final bool checkObscrured;
  final String? passwordText;
  final VoidCallback? onEyeTap;

  AuthTextField({
    required this.title,
    required this.controller,
    this.passwordText,
    this.inputAction,
    this.isObscure = false,
    this.isNumber = false,
    this.isUsername = false,
    this.isEmail = false,
    this.isPassword = false,
    this.checkObscrured = true,
    this.isConfirmPassword = false,
    this.onEyeTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: CustomColors.textColor1,
          ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Field can't be left empty";
        }
        if (isNumber &&
            (value.length != 10 || !RegExp(r'^[0-9]*$').hasMatch(value))) {
          return "Please enter a valid 10 digit mobile number";
        }
        if (isUsername && (value.length < 4 || value.length > 15)) {
          return "Username must be at between 4 to 10 characters only";
        }
        if (isUsername && value.contains(" ")) {
          return "Username can't contain spaces";
        }
        if (isUsername && !RegExp(r'^[a-zA-Z0-9_]*$').hasMatch(value)) {
          return "Username can't contain special characters other than underscore";
        }
        if (isEmail && !value.contains("@")) {
          return "Please enter a valid email address";
        }
        if (isConfirmPassword && value.toString() != passwordText) {
          return "Confirm Password and Your Password must be same";
        }
        if (isPassword && value.length < 6) {
          return "Password must be at least 6 characters long and combination of Capital and Small letters, Numbers and Special characters";
        }
        return null;
      },
      controller: controller,
      maxLength: 50,
      textInputAction: inputAction ?? TextInputAction.next,
      cursorColor: CustomColors.textColor1,
      obscureText: isObscure,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: title,
        counterText: "",
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        suffixIcon: (title == "Your Password")
            ? GestureDetector(
                onTap: onEyeTap,
                child: Icon(
                  Icons.remove_red_eye_outlined,
                  color: (checkObscrured)
                      ? CustomColors.textColor1
                      : CustomColors.textColor1.withOpacity(0.5),
                ))
            : null,
        hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: CustomColors.textColor1,
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: CustomColors.backgroundColor2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: CustomColors.primaryColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.red),
        ),
        errorMaxLines: 2,
        filled: true,
        fillColor: CustomColors.textFieldColor,
      ),
    );
  }
}
