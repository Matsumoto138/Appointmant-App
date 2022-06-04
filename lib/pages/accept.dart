import 'package:appointment_app/pages/main_page.dart';
import 'package:flutter/material.dart';

class Accept extends StatefulWidget {
  const Accept({Key? key}) : super(key: key);

  @override
  State<Accept> createState() => _AcceptState();
}

class _AcceptState extends State<Accept> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Randevu İşlemi Tamamlandı",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/Accept-icon.png',
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MainPage()));
              },
              child: Text("Tamam"),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 89, 154, 252),
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
            )
          ],
        ),
      ),
    );
  }
}
