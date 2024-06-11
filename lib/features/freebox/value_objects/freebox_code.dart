import 'package:equatable/equatable.dart';

final class FreeboxCode extends Equatable {
  final String value;

  const FreeboxCode(this.value) : assert(value.length == 6);

  @override
  List<Object?> get props => [
        value,
      ];
}
