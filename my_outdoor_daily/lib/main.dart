// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_outdoor_daily/data/local_storage.dart';
import 'package:my_outdoor_daily/pages/login_page.dart';
import 'package:my_outdoor_daily/route/controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'model/dont_forget_task.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<LocalStorage>(HiveLocalStorage());
}

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  var taskBox = await Hive.openBox<Task>('tasks');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setupHive();
  setup();
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
