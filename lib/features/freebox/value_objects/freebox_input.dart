import 'package:equatable/equatable.dart';

final class FreeboxInput extends Equatable {
  final String value;

  const FreeboxInput._(this.value);

  @override
  List<Object?> get props => [
        value,
      ];
}

abstract final class FreeboxInputs {
  static const FreeboxInput red = FreeboxInput._("red");
  static const FreeboxInput green = FreeboxInput._("green");
  static const FreeboxInput blue = FreeboxInput._("blue");
  static const FreeboxInput yellow = FreeboxInput._("yellow");

  static const FreeboxInput tv = FreeboxInput._("tv");
  static const FreeboxInput power = FreeboxInput._("power");

  static const FreeboxInput n1 = FreeboxInput._("1");
  static const FreeboxInput n2 = FreeboxInput._("2");
  static const FreeboxInput n3 = FreeboxInput._("3");
  static const FreeboxInput n4 = FreeboxInput._("4");
  static const FreeboxInput n5 = FreeboxInput._("5");
  static const FreeboxInput n6 = FreeboxInput._("6");
  static const FreeboxInput n7 = FreeboxInput._("7");
  static const FreeboxInput n8 = FreeboxInput._("8");
  static const FreeboxInput n9 = FreeboxInput._("9");
  static const FreeboxInput n0 = FreeboxInput._("0");

  static const FreeboxInput ok = FreeboxInput._("ok");
  static const FreeboxInput up = FreeboxInput._("up");
  static const FreeboxInput down = FreeboxInput._("down");
  static const FreeboxInput left = FreeboxInput._("left");
  static const FreeboxInput right = FreeboxInput._("right");

  static const FreeboxInput home = FreeboxInput._("home");
  static const FreeboxInput mute = FreeboxInput._("mute");
  static const FreeboxInput rec = FreeboxInput._("rec");

  static const FreeboxInput volUp = FreeboxInput._("vol_inc");
  static const FreeboxInput volDown = FreeboxInput._("vol_dec");
  static const FreeboxInput prgmUp = FreeboxInput._("prgm_inc");
  static const FreeboxInput prgmDown = FreeboxInput._("prgm_dec");

  static const FreeboxInput backward = FreeboxInput._("bwd");
  static const FreeboxInput play = FreeboxInput._("play");
  static const FreeboxInput forward = FreeboxInput._("fwd");

  static const FreeboxInput placeholder = FreeboxInput._("");
  static const FreeboxInput volPlaceholder = FreeboxInput._("");
  static const FreeboxInput progPlaceholder = FreeboxInput._("");
}
