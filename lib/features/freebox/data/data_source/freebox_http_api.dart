import 'package:freebox_remote_controller/features/freebox/data/data_source/freebox_api.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_code.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';
import 'package:http/http.dart' as http;

final class FreeboxHttpApi implements FreeboxApi {
  final http.Client client;

  FreeboxHttpApi(this.client);

  @override
  Future<void> sendCommand({
    required FreeboxCode code,
    required FreeboxInput input,
    bool longPress = false,
  }) {
    final query =
        'http://hd1.freebox.fr/pub/remote_control?code=${code.value}&key=${input.value}&long=$longPress';
    return client.get(
      Uri.parse(query),
    );
  }
}
