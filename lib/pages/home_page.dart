import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/widgets/num_pad_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NumPadWidget()
      ),
    );
  }
}


