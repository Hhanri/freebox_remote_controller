import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freebox_remote_controller/config/setup_container.dart';
import 'package:freebox_remote_controller/features/freebox/presentation/pages/freebox_remote_controller_page_wrapper.dart';

import 'core/resources/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await setupContainer();
  runApp(const MyApp());
}

@pragma("vm:entry-point")
void overlayMain() {
  main();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: SystemStrings.appTitle,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const FreeboxRemoteControllerPageWrapper(),
    );
  }
}
