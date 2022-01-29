import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/widgets/buttons_sections.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: PowerRowWidget(), flex: 1,),
              Expanded(child: NumPadWidget(), flex: 4,),
              Expanded(child: DirectionalButtonsWidget(), flex: 3,),
              const Expanded(child: FreeButtonWidget(), flex: 1,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    VolColumnWidget(),
                    MidColumnWidget(),
                    ProgColumnWidget()
                  ],
                ),
                flex: 3,
              ),
              Expanded(child: PlayRowWidget(), flex: 1,)
            ],
          ),
        )
      ),
    );
  }
}


