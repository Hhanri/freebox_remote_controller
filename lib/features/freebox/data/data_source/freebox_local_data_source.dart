import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_code.dart';

abstract interface class FreeboxLocalDataSourceInterface {
  Future<FreeboxCode?> getCode();

  Future<void> saveCode(FreeboxCode code);
}
