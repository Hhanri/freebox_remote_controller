import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freebox_remote_controller/features/freebox/data/data_source/freebox_sp_local_data_source.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_code.dart';

import '../../../test_setup/shared_preferences.dart';

void main() async {
  final prefs = await setupSharedPreferencesTest();
  final dataSource = FreeboxSPLocalDataSource(prefs);

  group("freebox sp local data source", () {
    group("get code test", () {
      test("null value should return null", () async {
        prefs.remove(FreeboxSPLocalDataSource.codeKey);
        expect(
          await dataSource.getCode().run(),
          const Right(Option.none()),
        );
      });

      test("empty string should return null", () async {
        prefs.setString(FreeboxSPLocalDataSource.codeKey, "");
        expect(
          await dataSource.getCode().run(),
          const Right(Option.none()),
        );
      });

      test("should return code", () async {
        const code = FreeboxCode("12345678");
        prefs.setString(FreeboxSPLocalDataSource.codeKey, code.value);
        expect(
          await dataSource.getCode().run(),
          const Right(Option.of(code)),
        );
      });
    });

    test("save code", () async {
      const code = FreeboxCode("12345678");
      expect(
        await dataSource.saveCode(code).run(),
        const Right(code),
      );

      expect(
        prefs.getString(FreeboxSPLocalDataSource.codeKey),
        code.value,
      );
    });
  });
}
