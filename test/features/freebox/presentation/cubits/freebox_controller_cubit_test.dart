import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freebox_remote_controller/core/result/empty.dart';
import 'package:freebox_remote_controller/core/result/failure.dart';
import 'package:freebox_remote_controller/core/result/success.dart';
import 'package:freebox_remote_controller/features/freebox/domain/use_cases/freebox_send_command_use_case.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/cubits/freebox_controller_cubit/freebox_controller_cubit.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';
import 'package:mocktail/mocktail.dart';

final class MockFreeboxSendCommandUseCase extends Mock
    implements FreeboxSendCommandUseCase {}

void main() {
  final sendCommandUseCase = MockFreeboxSendCommandUseCase();

  FreeboxControllerCubit createCubit() {
    return FreeboxControllerCubit(sendCommandUseCase: sendCommandUseCase);
  }

  group("freebox controller cubit test", () {
    test("initial state", () {
      final cubit = createCubit();
      expect(cubit.state, FreeboxControllerInitial());
    });

    group("on tap test", () {
      const input = FreeboxInputs.ok;

      test("on tap failure", () async {
        final cubit = createCubit();

        when(
          () => sendCommandUseCase.call(
            input: input,
            longTap: false,
          ),
        ).thenAnswer(
          (_) => TaskEither.left(
            const Failure(message: "command error"),
          ),
        );

        expect(
          cubit.stream,
          emitsInOrder([
            FreeboxControllerInitial(),
            const FreeboxControllerError("command error"),
          ]),
        );

        await cubit.onTap(input);
      });

      test("on tap success", () async {
        final cubit = createCubit();

        when(
          () => sendCommandUseCase.call(
            input: input,
            longTap: false,
          ),
        ).thenAnswer(
          (_) => TaskEither.right(
            const Success(value: Empty()),
          ),
        );
        await cubit.onTap(input);

        expect(
          cubit.stream,
          FreeboxControllerInitial(),
        );
      });
    });

    reset(sendCommandUseCase);

    group("on long press test", () {
      const input = FreeboxInputs.ok;

      test("on long press failure", () async {
        final cubit = createCubit();

        when(
          () => sendCommandUseCase.call(
            input: input,
            longTap: true,
          ),
        ).thenAnswer(
          (_) => TaskEither.left(
            const Failure(message: "command error"),
          ),
        );

        expect(
          cubit.stream,
          emitsInOrder([
            FreeboxControllerInitial(),
            const FreeboxControllerError("command error"),
          ]),
        );

        await cubit.onLongPress(input);
      });

      test("on long press success", () async {
        final cubit = createCubit();

        when(
          () => sendCommandUseCase.call(
            input: input,
            longTap: true,
          ),
        ).thenAnswer(
          (_) => TaskEither.right(
            const Success(value: Empty()),
          ),
        );
        await cubit.onLongPress(input);

        expect(
          cubit.stream,
          FreeboxControllerInitial(),
        );
      });
    });
  });
}
