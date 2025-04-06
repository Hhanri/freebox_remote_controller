import 'package:fpdart/fpdart.dart';
import 'package:freebox_remote_controller/core/result/result.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_code.dart';

abstract interface class FreeboxLocalDataSourceInterface {
  TaskEither<Failure, Option<FreeboxCode>> getCode();

  TaskEither<Failure, FreeboxCode> saveCode(FreeboxCode code);
}
