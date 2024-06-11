import 'package:equatable/equatable.dart';

export 'package:freebox_remote_controller/core/result/api_response.dart';
export 'package:freebox_remote_controller/core/result/empty.dart';
export 'package:freebox_remote_controller/core/result/execute.dart';
export 'package:freebox_remote_controller/core/result/failure.dart';
export 'package:freebox_remote_controller/core/result/success.dart';

abstract class Result extends Equatable {
  const Result();
}
