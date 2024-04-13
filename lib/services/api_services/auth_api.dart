import 'dart:convert';
import 'dart:developer';
import 'package:devsync/constants/server.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/user_model.dart';
import '../local_storage_services/helper_functions/handle_login.dart';

class AuthApi {
  final String baseUrl = ServerConstants.baseUrl;
  final headers = {"Content-type": "application/json"};

  //create post request for signup
  Future<String?> signUp(UserModel user) async {
    try {
      final url = Uri.parse('$baseUrl/register');
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(user.toJson()),
      );
      final res = jsonDecode(response.body);
      if (res != null) {
        if (response.statusCode == 200) {
          debugPrint(response.body);
          log("Signup Success");
          debugPrint(res.toString());
          debugPrint("User Account Created SUCCESSFULLY");
          return res['message'];
        } else if (response.statusCode == 400) {
          log("Signup Failed");
          debugPrint(response.body);
          throw res["message"];
        } else {
          log("Signup Failed");
          debugPrint(response.statusCode.toString());
          debugPrint(response.body);
          throw res["message"];
        }
      } else {
        log("Signup Failed");
        debugPrint(response.body);
        throw 'Failed to signup, please try again later';
      }
    } catch (e) {
      log("Signup Failed");
      debugPrint(e.toString());
      rethrow;
    }
  }

  //create post request for login
  Future<UserModel?> login(UserModel user) async {
    try {
      debugPrint("Flag 1");
      final url = Uri.parse('$baseUrl/login');
      debugPrint(user.toJson().toString());
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          "username": user.username,
          "password": user.password,
        }),
      );
      debugPrint("Flag 1.2");
      debugPrint(response.body);
      final res = jsonDecode(response.body);
      debugPrint("Flag 2");
      if (res != null) {
        if (res["type"] == "success") {
          debugPrint(response.body);
          log("Login Success");
          debugPrint(res.toString());
          debugPrint(res['token']);
          debugPrint("User Logged In SUCCESSFULLY");
          UserModel userModel = UserModel.fromJson(res);
          HandleLogin().saveLoginDetails(userModel);
          debugPrint(userModel.toJson().toString());
          return userModel;
        } else {
          log("Login Failed");
          debugPrint(response.statusCode.toString());
          debugPrint(response.body);
          throw res["message"];
        }
      } else {
        log("Login Failed");
        debugPrint(response.body);
        throw 'Failed to login, please try again later';
      }
    } catch (e) {
      log("Login Failed");
      debugPrint(e.toString());
      rethrow;
    }
  }
}
