import 'package:freebox_remote_controller/core/result/result.dart';

class Failure extends Result {
  final int? code;
  final String message;
  const Failure({
    this.code,
    required this.message,
  });

  @override
  List<Object?> get props => [code, message];
}
