import 'package:appointment_app/pages/appointment.dart';
import 'package:appointment_app/pages/explore.dart';
import 'package:appointment_app/pages/home.dart';
import 'package:appointment_app/pages/login.dart';
import 'package:appointment_app/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(backgroundColor: Colors.blueAccent),
      home: Scaffold(
        body: MainPage(), //screens[currentIndex],
      ),
    );
  }
}
