import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/widgets/buttons_sections.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PowerRowWidget(),
              NumPadWidget(),
              DirectionalButtonsWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  VolColumnWidget(),
                  MidColumnWidget(),
                  ProgColumnWidget()
                ],
              ),
              PlayRowWidget()
            ],
          ),
        )
      ),
    );
  }
}


