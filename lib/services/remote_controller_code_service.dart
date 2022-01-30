import 'package:freebox_remote_controller/resources/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteCodeControllerPreferences {

  static const int defaultCode = 0;
  static const int nullCode = 12345678;
  static late SharedPreferences preferences;

  static Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void saveCode(int newCode) async {
    await preferences.setInt(SystemStrings.codePreferencesKey, newCode);
  }

  static Future<int> loadCode() async {
    return preferences.getInt(SystemStrings.codePreferencesKey) ?? 12345678;
  }

}