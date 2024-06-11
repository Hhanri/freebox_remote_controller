import 'package:fpdart/fpdart.dart';
import 'package:freebox_remote_controller/core/result/result.dart';
import 'package:freebox_remote_controller/features/freebox/domain/repository/freebox_repository_interface.dart';

interface class FreeboxGetCodeUseCase {
  final FreeboxRepositoryInterface repo;

  FreeboxGetCodeUseCase(this.repo);

  TaskEither<Failure, Success<String?>> call() {
    return repo.getCode();
  }
}
