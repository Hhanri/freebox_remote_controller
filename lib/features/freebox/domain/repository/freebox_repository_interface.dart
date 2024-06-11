import 'package:fpdart/fpdart.dart';
import 'package:freebox_remote_controller/core/result/result.dart';

abstract interface class FreeboxRepositoryInterface {
  TaskEither<Failure, EmptySuccess> saveCode(String code);

  TaskEither<Failure, Success<String?>> getCode();

  TaskEither<Failure, EmptySuccess> sendCommand({
    required String input,
    bool longTap = false,
  });
}
