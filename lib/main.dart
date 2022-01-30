import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freebox_remote_controller/pages/home_page.dart';
import 'package:freebox_remote_controller/resources/strings.dart';
import 'package:freebox_remote_controller/services/remote_controller_code_service.dart';

import 'services/api_service.dart';
import 'services/remote_controller_code_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  );
  await RemoteCodeControllerPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: SystemStrings.appTitle,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<int>(
        future: RemoteCodeControllerPreferences.loadCode(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == RemoteCodeControllerPreferences.defaultCode) {
              RemoteCodeControllerPreferences.saveCode(RemoteCodeControllerPreferences.nullCode);
            }
            return const HomeScreen();
          }
          return const Center(child: CircularProgressIndicator());
        }
      ),
    );
  }
}