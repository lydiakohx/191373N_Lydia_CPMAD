import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  ///For save the user details
  static saveUser(UserData userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userData', jsonEncode(userData.toJson()));
  }

  ///For get the user details
  static Future<UserData> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('userData');
    Map<String, dynamic> map = parseAndDecode(userData);
    return UserData.fromJson(map);
  }

  /// For clearing the storage
  static clearStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<Map<String, dynamic>> parseJson(String text) {
    return compute(parseAndDecode, text);
  }

  static Map<String, dynamic> parseAndDecode(String response) {
    return jsonDecode(response) as Map<String, dynamic>;
  }
}
