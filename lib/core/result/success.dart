import 'package:freebox_remote_controller/core/result/result.dart';

class Success<T> extends Result {
  final T value;
  const Success({
    required this.value,
  });

  @override
  List<Object?> get props => [value];
}

typedef EmptySuccess = Success<Empty>;
