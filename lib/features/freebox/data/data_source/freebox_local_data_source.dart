abstract interface class FreeboxLocalDataSourceInterface {
  Future<String?> getCode();

  Future<void> saveCode(String code);
}
