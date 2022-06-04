import 'package:appointment_app/pages/home.dart';
import 'package:appointment_app/pages/login.dart';
import 'package:appointment_app/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appointment_app/pages/appointment.dart';
import 'package:appointment_app/pages/explore.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final screens = [
    HomePageView(),
    AppointmentView(
        srcImage: "assets/images/none.svg.png", name: " ", degree: " "),
    ExploreView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return screens[currentIndex];
          } else {
            return LoginView();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Ana Sayfa'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: 'Randevularım'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_outline), label: 'Keşfet'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profilim'),
        ],
      ),
    );
  }
}
