import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freebox_remote_controller/features/freebox/domain/use_cases/freebox_send_command_use_case.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';

part 'freebox_controller_state.dart';

class FreeboxControllerCubit extends Cubit<FreeboxControllerState> {
  final FreeboxSendCommandUseCase sendCommandUseCase;
  FreeboxControllerCubit({
    required this.sendCommandUseCase,
  }) : super(FreeboxControllerInitial());

  Future<void> _tap({
    required FreeboxInput input,
    required bool longTap,
  }) async {
    final res = await sendCommandUseCase
        .call(
          input: input,
          longTap: longTap,
        )
        .run();
    res.fold(
      (failure) => emit(FreeboxControllerError(failure.message)),
      (success) => emit(FreeboxControllerInitial()),
    );
  }

  Future<void> onTap(FreeboxInput input) async {
    return _tap(input: input, longTap: false);
  }

  Future<void> onLongPress(FreeboxInput input) async {
    return _tap(input: input, longTap: true);
  }
}
