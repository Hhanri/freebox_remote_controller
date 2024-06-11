import 'package:fpdart/fpdart.dart';
import 'package:freebox_remote_controller/core/result/result.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';

abstract interface class FreeboxRepositoryInterface {
  TaskEither<Failure, EmptySuccess> saveCode(String code);

  TaskEither<Failure, Success<String?>> getCode();

  TaskEither<Failure, EmptySuccess> sendCommand({
    required FreeboxInput input,
    bool longTap = false,
  });
}
