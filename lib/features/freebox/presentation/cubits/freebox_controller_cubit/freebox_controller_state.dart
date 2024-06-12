part of 'freebox_controller_cubit.dart';

sealed class FreeboxControllerState extends Equatable {
  const FreeboxControllerState();
}

final class FreeboxControllerInitial extends FreeboxControllerState {
  @override
  List<Object> get props => [];
}

final class FreeboxControllerError extends FreeboxControllerState {
  final String message;

  const FreeboxControllerError(this.message);
  @override
  List<Object> get props => [
        message,
      ];
}
