import 'package:freebox_remote_controller/features/freebox/data/data_source/freebox_api.dart';
import 'package:http/http.dart' as http;

final class FreeboxHttpApi implements FreeboxApi {
  final http.Client client;

  FreeboxHttpApi(this.client);

  @override
  Future<void> sendCommand({
    required String code,
    required String input,
    bool longPress = false,
  }) {
    final query =
        'http://hd1.freebox.fr/pub/remote_control?code=$code&key=$input&long=$longPress';
    return client.get(
      Uri.parse(query),
    );
  }
}
