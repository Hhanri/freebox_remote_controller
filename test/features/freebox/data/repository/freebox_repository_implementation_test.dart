import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freebox_remote_controller/core/result/result.dart';
import 'package:freebox_remote_controller/features/freebox/data/data_source/freebox_api.dart';
import 'package:freebox_remote_controller/features/freebox/data/data_source/freebox_local_data_source.dart';
import 'package:freebox_remote_controller/features/freebox/data/repository/freebox_repository_implementation.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_code.dart';
import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_input.dart';
import 'package:mocktail/mocktail.dart';

final class MockFreeboxApi extends Mock implements FreeboxApi {}

final class MockFreeboxLocalDataSource extends Mock
    implements FreeboxLocalDataSourceInterface {}

void main() {
  final freeboxApi = MockFreeboxApi();
  final localDataSource = MockFreeboxLocalDataSource();
  final repo = FreeboxRepositoryImplementation(
    localDataSource: localDataSource,
    freeboxApi: freeboxApi,
  );

  group("freebox repository test", () {
    group("get code", () {
      test("failure", () async {
        when(
          localDataSource.getCode,
        ).thenThrow(
          "error",
        );

        final res = await repo.getCode().run();
        expect(
          res,
          const Left(Failure(message: "error")),
        );
      });

      test("success", () async {
        const code = FreeboxCode("12345678");
        when(
          localDataSource.getCode,
        ).thenAnswer(
          (_) async => code,
        );

        final res = await repo.getCode().run();
        expect(
          res,
          const Right<Failure, Success<FreeboxCode?>>(Success(value: code)),
        );
      });
    });

    group("save code", () {
      const code = FreeboxCode("12345678");
      test("failure", () async {
        when(
          () => localDataSource.saveCode(code),
        ).thenThrow("error");

        final res = await repo.saveCode(code).run();
        expect(
          res,
          const Left(Failure(message: "error")),
        );
      });
      test("success", () async {
        when(
          () => localDataSource.saveCode(code),
        ).thenAnswer(
          (_) async => const Empty(),
        );

        final res = await repo.saveCode(code).run();
        expect(
          res,
          const Right(Success(value: Empty())),
        );
      });
    });

    group("send command", () {
      const input = FreeboxInputs.ok;

      test("get code error", () async {
        when(
          localDataSource.getCode,
        ).thenThrow(
          "get code error",
        );

        final res = await repo.sendCommand(input: input).run();

        expect(
          res,
          const Left(Failure(message: "get code error")),
        );
      });

      test("get code null", () async {
        when(
          localDataSource.getCode,
        ).thenAnswer(
          (_) async => null,
        );

        final res = await repo.sendCommand(input: input).run();

        expect(
          res,
          const Left(Failure(message: "Exception: Missing Freebox Code")),
        );
      });

      const code = FreeboxCode("12345678");

      test("send command error", () async {
        when(
          localDataSource.getCode,
        ).thenAnswer(
          (_) async => code,
        );
        when(
          () => freeboxApi.sendCommand(code: code, input: input),
        ).thenThrow(
          "send command error",
        );

        final res = await repo.sendCommand(input: input).run();

        expect(
          res,
          const Left(Failure(message: "send command error")),
        );
      });

      test("send command success", () async {
        when(
          localDataSource.getCode,
        ).thenAnswer(
          (_) async => code,
        );
        when(
          () => freeboxApi.sendCommand(code: code, input: input),
        ).thenAnswer(
          (_) async => const Empty(),
        );

        final res = await repo.sendCommand(input: input).run();

        expect(
          res,
          const Right(Success(value: Empty())),
        );
      });
    });
  });
}
