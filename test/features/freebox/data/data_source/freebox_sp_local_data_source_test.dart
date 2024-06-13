import 'package:flutter_test/flutter_test.dart';
import 'package:freebox_remote_controller/core/result/empty.dart';
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
          await dataSource.getCode(),
          null,
        );
      });

      test("empty string should return null", () async {
        prefs.setString(FreeboxSPLocalDataSource.codeKey, "");
        expect(
          await dataSource.getCode(),
          null,
        );
      });

      test("should return code", () async {
        const code = FreeboxCode("12345678");
        prefs.setString(FreeboxSPLocalDataSource.codeKey, code.value);
        expect(
          await dataSource.getCode(),
          code,
        );
      });
    });

    test("save code", () async {
      const code = FreeboxCode("12345678");
      expect(
        await dataSource.saveCode(code),
        const Empty(),
      );

      expect(
        prefs.getString(FreeboxSPLocalDataSource.codeKey),
        code.value,
      );
    });
  });
}
