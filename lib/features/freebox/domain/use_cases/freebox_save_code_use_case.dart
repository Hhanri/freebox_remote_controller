import 'package:fpdart/fpdart.dart';
import 'package:freebox_remote_controller/core/result/result.dart';
import 'package:freebox_remote_controller/features/freebox/domain/repository/freebox_repository_interface.dart';

interface class FreeboxSaveCodeUseCase {
  final FreeboxRepositoryInterface repo;

  FreeboxSaveCodeUseCase(this.repo);

  TaskEither<Failure, EmptySuccess> call(String code) {
    return repo.saveCode(code);
  }
}
