extension NumberValidator on String {
  bool isEightDigits() {
    return RegExp("\\b\\d{8}\\b").hasMatch(this);
  }
}