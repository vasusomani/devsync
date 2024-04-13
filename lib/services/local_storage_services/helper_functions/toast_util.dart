import 'package:fluttertoast/fluttertoast.dart';

import '../../../Constants/colors.dart';

class ToastWidgit {
  static void bottomToast(String msg) async {
    await Fluttertoast.cancel();
    await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: CustomColors.primaryColor,
      textColor: CustomColors.textColor3,
      fontSize: 14.0,
    );
  }
}
