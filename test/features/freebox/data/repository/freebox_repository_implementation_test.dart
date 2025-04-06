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
          (_) => TaskEither.right(const Option.of(code)),
        );

        final res = await repo.getCode().run();
        expect(
          res,
          const Right(Option.of(code)),
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
          (_) => TaskEither.right(code),
        );

        final res = await repo.saveCode(code).run();
        expect(
          res,
          const Right(code),
        );
      });
    });

    group("send command", () {
      const input = FreeboxInputs.ok;
      const code = FreeboxCode("12345678");
      const longPress = false;

      test("failure", () async {
        when(
          () => freeboxApi.sendCommand(
            code: code,
            input: input,
            longPress: longPress,
          ),
        ).thenAnswer(
          (_) => TaskEither.left(const Failure(message: "message")),
        );

        final res = await repo
            .sendCommand(input: input, code: code, longTap: longPress)
            .run();

        expect(
          res,
          const Left(Failure(message: "message")),
        );
      });

      test("success", () async {
        when(
          () => freeboxApi.sendCommand(
            code: code,
            input: input,
            longPress: longPress,
          ),
        ).thenAnswer(
          (_) => TaskEither.right(unit),
        );

        final res = await repo
            .sendCommand(input: input, code: code, longTap: longPress)
            .run();

        expect(
          res,
          const Right(unit),
        );
      });
    });
  });
}
