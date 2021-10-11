import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreferenceHelper {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key) ?? "");
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getBool(key);
  }
}
