import 'package:fpdart/fpdart.dart';
import 'package:freebox_remote_controller/core/result/result.dart';
import 'package:freebox_remote_controller/features/freebox/domain/repository/freebox_repository_interface.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_code.dart';

interface class FreeboxSaveCodeUseCase {
  final FreeboxRepositoryInterface repo;

  FreeboxSaveCodeUseCase(this.repo);

  TaskEither<Failure, EmptySuccess> call(FreeboxCode code) {
    return repo.saveCode(code);
  }
}
