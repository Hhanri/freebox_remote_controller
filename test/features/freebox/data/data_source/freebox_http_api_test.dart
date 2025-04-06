import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freebox_remote_controller/core/result/result.dart';
import 'package:freebox_remote_controller/features/freebox/data/data_source/freebox_http_api.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_code.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_setup/mock_http.dart';

void main() {
  final client = MockHttpClient();

  const code = FreeboxCode("12345678");
  const input = FreeboxInputs.ok;
  const longPress = false;
  final uri = Uri.parse(
    'http://hd1.freebox.fr/pub/remote_control?code=${code.value}&key=${input.value}&long=$longPress',
  );
  final api = FreeboxHttpApi(client);

  group("freebox http api test", () {
    group("send command test", () {
      test("success", () async {
        when(
          () => client.get(uri),
        ).thenAnswer(
          (_) async => httpResponseFromObject("ok", 200),
        );
        final res = await api.sendCommand(code: code, input: input).run();
        expect(res, const Right(unit));
      });

      test("error", () async {
        when(
          () => client.get(uri),
        ).thenAnswer(
          (_) async => httpResponseFromObject("error", 400),
        );
        final res = await api.sendCommand(code: code, input: input).run();
        expect(
          res,
          const Left<Failure, Unit>(Failure(message: '"error"')),
        );
      });
    });
  });
}
