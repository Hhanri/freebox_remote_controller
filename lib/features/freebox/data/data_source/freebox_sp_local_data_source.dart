import 'package:fpdart/fpdart.dart';
import 'package:freebox_remote_controller/core/extensions/fp_extensions.dart';
import 'package:freebox_remote_controller/core/extensions/string_extensions.dart';
import 'package:freebox_remote_controller/core/result/result.dart';
import 'package:freebox_remote_controller/features/freebox/data/data_source/freebox_local_data_source.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_code.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class FreeboxSPLocalDataSource
    implements FreeboxLocalDataSourceInterface {
  final SharedPreferences sp;

  FreeboxSPLocalDataSource(this.sp);

  static const codeKey = "code";

  @override
  TaskEither<Failure, Option<FreeboxCode>> getCode() {
    return TaskEither.tryCatch(
      () async {
        return Option.fromNullable(
          sp.getString(codeKey)?.nullIfEmpty()?.map((s) => FreeboxCode(s)),
        );
      },
      (e, _) => Failure(message: e.toString()),
    );
  }

  @override
  TaskEither<Failure, FreeboxCode> saveCode(FreeboxCode code) {
    return TaskEither.tryCatch(
      () async {
        await sp.setString(codeKey, code.value);
        return code;
      },
      (e, _) => Failure(message: e.toString()),
    );
  }
}
