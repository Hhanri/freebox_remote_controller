import 'package:freebox_remote_controller/features/freebox/value_objects/freebox_code.dart';

import '../../value_objects/freebox_input.dart';

abstract interface class FreeboxApi {
  Future<void> sendCommand({
    required FreeboxCode code,
    required FreeboxInput input,
    bool longPress = false,
  });
}
