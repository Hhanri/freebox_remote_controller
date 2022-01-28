import 'package:flutter/material.dart';

class RemoteButtonKeyStrings {

  static const String red = "red";
  static const String green = "green";
  static const String blue = "blue";
  static const String yellow = "yellow";

  static const String power = "power";

  static const String n1 = "1";
  static const String n2 = "2";
  static const String n3 = "3";
  static const String n4 = "4";
  static const String n5 = "5";
  static const String n6 = "6";
  static const String n7 = "7";
  static const String n8 = "8";
  static const String n9 = "9";
  static const String n0 = "0";

  static const String ok = "ok";
  static const String up = "up";
  static const String down = "down";
  static const String left = "left";
  static const String right = "right";

  static const String home = "home";
  static const String mute = "mute";
  static const String rec = "rec";

  static const String volUp = "vol_inc";
  static const String volDown = "vol_dec";
  static const String prgmUp = "prgm_inc";
  static const String prgmDown = "prgm_dec";

  static const String backward = "bwd";
  static const String play = "play";
  static const String forward = "fwd";

  static const String placeholder = "";
}



class RemoteButtonIconWidget {

  static const Widget red = Icon(Icons.arrow_back);
  static const Widget green = Icon(Icons.list_alt);
  static const Widget blue = Icon(Icons.search);
  static const Widget yellow = Icon(Icons.info_outline);

  static const Widget power = Icon(Icons.power_settings_new);

  static const Widget n1 = Text(RemoteButtonKeyStrings.n1);
  static const Widget n2 = Text(RemoteButtonKeyStrings.n2);
  static const Widget n3 = Text(RemoteButtonKeyStrings.n3);
  static const Widget n4 = Text(RemoteButtonKeyStrings.n4);
  static const Widget n5 = Text(RemoteButtonKeyStrings.n5);
  static const Widget n6 = Text(RemoteButtonKeyStrings.n6);
  static const Widget n7 = Text(RemoteButtonKeyStrings.n7);
  static const Widget n8 = Text(RemoteButtonKeyStrings.n8);
  static const Widget n9 = Text(RemoteButtonKeyStrings.n9);
  static const Widget n0 = Text(RemoteButtonKeyStrings.n0);

  static const Widget ok = Text(RemoteButtonKeyStrings.ok);
  static const Widget up = Icon(Icons.arrow_drop_up);
  static const Widget down = Icon(Icons.arrow_drop_down);
  static const Widget left = Icon(Icons.arrow_left);
  static const Widget right = Icon(Icons.arrow_right);

  static const Widget home = Text("FREE");
  static const Widget mute = Icon(Icons.volume_off);
  static const Widget rec = Icon(Icons.fiber_manual_record, color: Colors.red);

  static const Widget volUp = Icon(Icons.add);
  static const Widget volDown = Icon(Icons.remove);
  static const Widget prgmUp = Icon(Icons.add);
  static const Widget prgmDown = Icon(Icons.remove);

  static const Widget backward = Icon(Icons.fast_rewind);
  static const Widget play = Icon(Icons.play_arrow);
  static const Widget forward = Icon(Icons.fast_forward);

  static const Widget placeholder = Text("");
}