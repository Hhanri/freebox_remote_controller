import 'package:fpdart/fpdart.dart';
import 'package:freebox_remote_controller/core/result/result.dart';
import 'package:freebox_remote_controller/features/freebox/domain/repository/freebox_repository_interface.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';

interface class FreeboxSendCommandUseCase {
  final FreeboxRepositoryInterface repo;

  FreeboxSendCommandUseCase(this.repo);

  TaskEither<Failure, Unit> call({
    required FreeboxInput input,
    bool longTap = false,
  }) {
    return repo.getCode().flatMap(
          (r) => r.fold(
            () => TaskEither.left(const Failure(message: "missing code")),
            (code) => repo.sendCommand(
              code: code,
              input: input,
              longTap: longTap,
            ),
          ),
        );
  }
}
