import '../../value_objects/freebox_input.dart';

abstract interface class FreeboxApi {
  Future<void> sendCommand({
    required String code,
    required FreeboxInput input,
    bool longPress = false,
  });
}
