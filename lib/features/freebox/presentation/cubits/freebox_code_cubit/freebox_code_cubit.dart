import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freebox_remote_controller/features/freebox/domain/use_cases/freebox_get_code_use_case.dart';
import 'package:freebox_remote_controller/features/freebox/domain/use_cases/freebox_save_code_use_case.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_code.dart';

part 'freebox_code_state.dart';

class FreeboxCodeCubit extends Cubit<FreeboxCodeState> {
  final FreeboxGetCodeUseCase getCodeUseCase;
  final FreeboxSaveCodeUseCase saveCodeUseCase;
  FreeboxCodeCubit({
    required this.getCodeUseCase,
    required this.saveCodeUseCase,
  }) : super(const FreeboxCodeInitial());

  Future<void> init() async {
    final res = await getCodeUseCase.call().run();
    res.fold(
      (failure) => emit(FreeboxCodeError(message: failure.message)),
      (success) => emit(FreeboxCodeInitial(code: success.value)),
    );
  }

  Future<void> saveCode(FreeboxCode code) async {
    final res = await saveCodeUseCase.call(code).run();
    res.fold(
      (failure) => emit(
        FreeboxCodeError(
          code: state.code,
          message: failure.message,
        ),
      ),
      (success) => emit(FreeboxCodeInitial(code: code)),
    );
  }
}
