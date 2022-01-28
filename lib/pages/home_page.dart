import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/widgets/buttons_sections.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PowerRowWidget(),
              NumPadWidget(),
              DirectionalButtonsWidget(),
            ],
          ),
        ),
      )
    );
  }
}


