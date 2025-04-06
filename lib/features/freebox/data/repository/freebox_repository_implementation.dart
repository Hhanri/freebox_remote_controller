import 'package:fpdart/fpdart.dart';
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
  TaskEither<Failure, Option<FreeboxCode>> getCode() {
    return localDataSource.getCode();
  }

  @override
  TaskEither<Failure, FreeboxCode> saveCode(FreeboxCode code) {
    return localDataSource.saveCode(code);
  }

  @override
  TaskEither<Failure, Unit> sendCommand({
    required FreeboxCode code,
    required FreeboxInput input,
    bool longTap = false,
  }) {
    return freeboxApi.sendCommand(
      code: code,
      input: input,
      longPress: longTap,
    );
  }
}
