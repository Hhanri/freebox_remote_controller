part of 'freebox_code_cubit.dart';

sealed class FreeboxCodeState extends Equatable {
  final FreeboxCode? code;
  const FreeboxCodeState({this.code});
}

final class FreeboxCodeInitial extends FreeboxCodeState {
  const FreeboxCodeInitial({super.code});
  @override
  List<Object?> get props => [
        code,
      ];
}

final class FreeboxCodeError extends FreeboxCodeState {
  final String message;

  const FreeboxCodeError({
    super.code,
    required this.message,
  });

  @override
  List<Object?> get props => [
        code,
        message,
      ];
}
