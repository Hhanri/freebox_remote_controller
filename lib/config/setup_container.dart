import 'package:freebox_remote_controller/features/freebox/data/data_source/freebox_api.dart';
import 'package:freebox_remote_controller/features/freebox/data/data_source/freebox_http_api.dart';
import 'package:freebox_remote_controller/features/freebox/data/data_source/freebox_local_data_source.dart';
import 'package:freebox_remote_controller/features/freebox/data/data_source/freebox_sp_local_data_source.dart';
import 'package:freebox_remote_controller/features/freebox/data/repository/freebox_repository_implementation.dart';
import 'package:freebox_remote_controller/features/freebox/domain/repository/freebox_repository_interface.dart';
import 'package:freebox_remote_controller/features/freebox/domain/use_cases/freebox_get_code_use_case.dart';
import 'package:freebox_remote_controller/features/freebox/domain/use_cases/freebox_save_code_use_case.dart';
import 'package:freebox_remote_controller/features/freebox/domain/use_cases/freebox_send_command_use_case.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/cubits/freebox_code_cubit/freebox_code_cubit.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/cubits/freebox_controller_cubit/freebox_controller_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> setupContainer() async {
  final sp = await SharedPreferences.getInstance();
  final client = http.Client();

  sl.registerLazySingleton<FreeboxApi>(() => FreeboxHttpApi(client));
  sl.registerLazySingleton<FreeboxLocalDataSourceInterface>(
    () => FreeboxSPLocalDataSource(sp),
  );
  sl.registerLazySingleton<FreeboxRepositoryInterface>(
    () => FreeboxRepositoryImplementation(
      localDataSource: sl.get<FreeboxLocalDataSourceInterface>(),
      freeboxApi: sl.get<FreeboxApi>(),
    ),
  );
  sl.registerLazySingleton<FreeboxSaveCodeUseCase>(
    () => FreeboxSaveCodeUseCase(sl.get<FreeboxRepositoryInterface>()),
  );
  sl.registerLazySingleton<FreeboxGetCodeUseCase>(
    () => FreeboxGetCodeUseCase(sl.get<FreeboxRepositoryInterface>()),
  );
  sl.registerLazySingleton<FreeboxSendCommandUseCase>(
    () => FreeboxSendCommandUseCase(sl.get<FreeboxRepositoryInterface>()),
  );

  sl.registerFactory<FreeboxControllerCubit>(
    () => FreeboxControllerCubit(
      sendCommandUseCase: sl.get<FreeboxSendCommandUseCase>(),
    ),
  );
  sl.registerFactory<FreeboxCodeCubit>(
    () => FreeboxCodeCubit(
      saveCodeUseCase: sl.get<FreeboxSaveCodeUseCase>(),
      getCodeUseCase: sl.get<FreeboxGetCodeUseCase>(),
    )..init(),
  );
}
