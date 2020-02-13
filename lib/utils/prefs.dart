import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  //LENDO DADOS DA SHARED PREFERENCES (BOOLEANO)
  static Future<bool> getBool(String key) async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.getBool(key) ?? false;
  }

  //salvando valor booleano
  static void setBool(String key, bool b) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setBool(key, b);
  }

  //LENDO DADOS DA SHARED PREFERENCES (inteiro)
  static Future<int> getInt(String key) async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.getInt(key) ?? 0;
  }

  //salvando valor inteiro
  static void setInt(String key, int i) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setInt(key, i);
  }

  //LENDO DADOS DA SHARED PREFERENCES (string)
  static Future<String> getString(String key) async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.getString(key) ?? "";
  }

  //salvando string
  static void setString(String key, String s) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setString(key, s);
  }
}
