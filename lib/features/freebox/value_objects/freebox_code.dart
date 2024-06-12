import 'package:equatable/equatable.dart';

final class FreeboxCode extends Equatable {
  final String value;

  const FreeboxCode(this.value) : assert(value.length == codeLength);

  static const int codeLength = 8;

  @override
  List<Object?> get props => [
        value,
      ];
}

extension FreeboxCodeUtil on String {
  bool get isValidFreeboxCode {
    return RegExp(r'^\d{8}$').hasMatch(this);
  }
}
