extension StringExtensions on String {
  String? nullIfEmpty() {
    return this == "" ? null : this;
  }
}
