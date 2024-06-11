import 'package:freebox_remote_controller/features/freebox/data/data_source/freebox_local_data_source.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_code.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class FreeboxSPLocalDataSource
    implements FreeboxLocalDataSourceInterface {
  final SharedPreferences sp;

  FreeboxSPLocalDataSource(this.sp);

  static const codeKey = "code";

  @override
  Future<FreeboxCode?> getCode() async {
    final val = sp.getString(codeKey);
    if (val == null) return null;
    return FreeboxCode(val);
  }

  @override
  Future<void> saveCode(FreeboxCode code) {
    return sp.setString(codeKey, code.value);
  }
}
