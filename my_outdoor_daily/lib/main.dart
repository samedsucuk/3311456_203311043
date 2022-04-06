// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:my_outdoor_daily/pages/login_page.dart';
import 'package:my_outdoor_daily/route/controller.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var generateRoute;
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black, fontFamily: 'Montserrat'),
      onGenerateRoute: Controller.generateRoute,
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
