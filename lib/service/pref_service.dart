import 'package:shared_preferences/shared_preferences.dart';

class PrefService{

  static Future<void> setIntro(bool intro)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("intro", intro);
  }

  static Future<bool?> loadIntro()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("intro");
  }
}