abstract interface class FreeboxApi {
  Future<void> sendCommand({
    required String code,
    required String input,
    bool longPress = false,
  });
}
