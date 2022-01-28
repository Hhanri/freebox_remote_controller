import 'package:http/http.dart';

class APIService {
  static void buttonFunction(String buttonKey, bool longPress) async {
    await get(Uri.parse('http://hd1.freebox.fr/pub/remote_control?code=33128888&key=$buttonKey&long=$longPress'));
  }
}