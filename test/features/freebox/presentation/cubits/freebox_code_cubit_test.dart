import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freebox_remote_controller/core/result/result.dart';
import 'package:freebox_remote_controller/features/freebox/domain/use_cases/freebox_get_code_use_case.dart';
import 'package:freebox_remote_controller/features/freebox/domain/use_cases/freebox_save_code_use_case.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/cubits/freebox_code_cubit/freebox_code_cubit.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_code.dart';
import 'package:mocktail/mocktail.dart';

final class MockFreeboxGetCodeUseCase extends Mock
    implements FreeboxGetCodeUseCase {}

final class MockFreeboxSaveCodeUseCase extends Mock
    implements FreeboxSaveCodeUseCase {}

void main() {
  final getCodeUseCase = MockFreeboxGetCodeUseCase();
  final saveCodeUseCase = MockFreeboxSaveCodeUseCase();

  FreeboxCodeCubit createCubit() {
    return FreeboxCodeCubit(
      getCodeUseCase: getCodeUseCase,
      saveCodeUseCase: saveCodeUseCase,
    );
  }

  group("freebox code cubit test", () {
    test("initial state", () async {
      final cubit = createCubit();
      expect(
        cubit.state,
        const FreeboxCodeInitial(code: null),
      );
    });

    group("init test", () {
      test("get code failure", () async {
        final cubit = createCubit();

        when(
          getCodeUseCase.call,
        ).thenAnswer(
          (_) => TaskEither.left(
            const Failure(message: "get code error"),
          ),
        );

        await cubit.init();
        expect(cubit.state, const FreeboxCodeError(message: "get code error"));
      });

      test("get code success null code", () async {
        final cubit = createCubit();

        when(
          getCodeUseCase.call,
        ).thenAnswer(
          (_) => TaskEither.right(const Option.none()),
        );

        await cubit.init();
        expect(cubit.state, const FreeboxCodeInitial(code: null));
      });

      test("get code success valid code", () async {
        final cubit = createCubit();

        when(
          getCodeUseCase.call,
        ).thenAnswer(
          (_) => TaskEither.right(
            const Option.of(FreeboxCode("12345678")),
          ),
        );

        await cubit.init();
        expect(
          cubit.state,
          const FreeboxCodeInitial(code: FreeboxCode("12345678")),
        );
      });
    });

    group("save code test", () {
      const newCode = FreeboxCode("13245678");

      test("save code error", () async {
        final cubit = createCubit();

        when(
          () => saveCodeUseCase.call(newCode),
        ).thenAnswer(
          (_) => TaskEither.left(const Failure(message: "save code error")),
        );

        await cubit.saveCode(newCode);

        expect(
          cubit.state,
          const FreeboxCodeError(message: "save code error"),
        );
      });

      test("save code success", () async {
        final cubit = createCubit();

        when(
          () => saveCodeUseCase.call(newCode),
        ).thenAnswer(
          (_) => TaskEither.right(newCode),
        );

        await cubit.saveCode(newCode);

        expect(
          cubit.state,
          const FreeboxCodeInitial(code: newCode),
        );
      });
    });
  });
}
