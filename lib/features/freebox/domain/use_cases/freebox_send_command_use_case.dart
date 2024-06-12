import 'package:fpdart/fpdart.dart';
import 'package:freebox_remote_controller/core/result/result.dart';
import 'package:freebox_remote_controller/features/freebox/domain/repository/freebox_repository_interface.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';

interface class FreeboxSendCommandUseCase {
  final FreeboxRepositoryInterface repo;

  FreeboxSendCommandUseCase(this.repo);

  TaskEither<Failure, EmptySuccess> call({
    required FreeboxInput input,
    bool longTap = false,
  }) {
    return repo.sendCommand(
      input: input,
      longTap: longTap,
    );
  }
}
