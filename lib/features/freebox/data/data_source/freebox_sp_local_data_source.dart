import 'package:freebox_remote_controller/features/freebox/data/data_source/freebox_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class FreeboxSPLocalDataSource
    implements FreeboxLocalDataSourceInterface {
  final SharedPreferences sp;

  FreeboxSPLocalDataSource(this.sp);

  static const codeKey = "code";

  @override
  Future<String?> getCode() async {
    return sp.getString(codeKey);
  }

  @override
  Future<void> saveCode(String code) {
    return sp.setString(codeKey, code);
  }
}
