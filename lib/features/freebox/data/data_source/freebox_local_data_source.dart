import 'package:freebox_remote_controller/core/result/result.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_code.dart';

abstract interface class FreeboxLocalDataSourceInterface {
  Future<FreeboxCode?> getCode();

  Future<Empty> saveCode(FreeboxCode code);
}
