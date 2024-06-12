import 'package:fpdart/fpdart.dart';
import 'package:fpdart/src/task_either.dart';
import 'package:freebox_remote_controller/core/result/result.dart';
import 'package:freebox_remote_controller/features/freebox/data/data_source/freebox_api.dart';
import 'package:freebox_remote_controller/features/freebox/data/data_source/freebox_local_data_source.dart';
import 'package:freebox_remote_controller/features/freebox/domain/repository/freebox_repository_interface.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_code.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';

final class FreeboxRepositoryImplementation
    implements FreeboxRepositoryInterface {
  final FreeboxLocalDataSourceInterface localDataSource;
  final FreeboxApi freeboxApi;

  FreeboxRepositoryImplementation({
    required this.localDataSource,
    required this.freeboxApi,
  });

  @override
  TaskEither<Failure, Success<FreeboxCode?>> getCode() {
    return execute(() => localDataSource.getCode());
  }

  @override
  TaskEither<Failure, EmptySuccess> saveCode(FreeboxCode code) {
    return execute(() => localDataSource.saveCode(code));
  }

  @override
  TaskEither<Failure, EmptySuccess> sendCommand({
    required FreeboxInput input,
    bool longTap = false,
  }) {
    return execute(() async {
      final code = await localDataSource.getCode();
      if (code == null) throw Exception("Missing Freebox Code");
      return freeboxApi.sendCommand(code: code, input: input);
    });
  }
}
