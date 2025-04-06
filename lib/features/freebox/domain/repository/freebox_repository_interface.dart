import 'package:fpdart/fpdart.dart';
import 'package:freebox_remote_controller/core/result/result.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_code.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';

abstract interface class FreeboxRepositoryInterface {
  TaskEither<Failure, FreeboxCode> saveCode(FreeboxCode code);

  TaskEither<Failure, Option<FreeboxCode>> getCode();

  TaskEither<Failure, Unit> sendCommand({
    required FreeboxCode code,
    required FreeboxInput input,
    bool longTap = false,
  });
}
