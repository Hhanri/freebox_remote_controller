import 'package:fpdart/fpdart.dart';
import 'package:freebox_remote_controller/core/result/result.dart';
import 'package:freebox_remote_controller/features/freebox/domain/repository/freebox_repository_interface.dart';

interface class FreeboxSendCommandUseCase {
  final FreeboxRepositoryInterface repo;

  FreeboxSendCommandUseCase(this.repo);

  TaskEither<Failure, EmptySuccess> call({
    required String input,
    bool longTap = false,
  }) {
    return repo.sendCommand(
      input: input,
      longTap: longTap,
    );
  }
}
