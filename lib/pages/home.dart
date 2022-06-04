// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:appointment_app/pages/suggest_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/rendering/box.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    const String text = "e-tercih";
    return Scaffold(
      endDrawer: const Drawer(),
      appBar: GlobalAppBar(
        text: text,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.01, 0.3],
                colors: [Colors.white, Color.fromRGBO(140, 201, 220, 1)])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: HomeSearchBar(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                "Öneriler",
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              height: 130,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // ignore: prefer_const_literals_to_create_immutables
                child: Row(
                  children: [
                    HomeCardView(
                        srcImage: 'assets/images/cv_img.png',
                        name: 'Fatih Demirbaş',
                        degree: 'Bilgisiayar Mühendisliği'),
                    HomeCardView(
                        srcImage: 'assets/images/person1.jpg',
                        name: 'Merve Serin',
                        degree: 'Ziraat Mühendisliği'),
                    HomeCardView(
                        srcImage: 'assets/images/person2.jpg',
                        name: 'Türkay Yıldız',
                        degree: 'İşletme'),
                    HomeCardView(
                        srcImage: 'assets/images/person3.jpg',
                        name: 'Ömer Faruk Özkan ',
                        degree: 'Metalurji Mühendisliği'),
                    HomeCardView(
                        srcImage: 'assets/images/person4.jpg',
                        name: 'Esra Akdoğan',
                        degree: 'Ekonometri'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Text(
                "Üniversiteler",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontSize: 24),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    HomeInkwell(
                      school: 'Ankara Üniversitesi',
                    ),
                    SizedBox(width: 12),
                    HomeInkwell(
                      school: 'Ankara Üniversitesi',
                    ),
                    SizedBox(width: 12),
                    HomeInkwell(
                      school: 'Orta Doğu Teknik Üniversitesi',
                    ),
                    SizedBox(width: 12),
                    HomeInkwell(
                      school: 'Hacı Bayram Veli Üniversitesi',
                    ),
                    SizedBox(width: 12),
                    HomeInkwell(
                      school: 'Orta Doğu Teknik Üniversitesi',
                    ),
                    SizedBox(width: 12),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Text(
                "Randevu Al",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontSize: 24),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              child: HomeBigButton(),
            )
          ],
        ),
      ),
    );
  }
}

class GlobalAppBar extends StatelessWidget with PreferredSizeWidget {
  const GlobalAppBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      backgroundColor: Color.fromARGB(198, 108, 206, 252),
      elevation: 0,
      // ignore: prefer_const_constructors
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: Color.fromARGB(0, 0, 0, 0)),

      centerTitle: true,
    );
  }
}

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: SizedBox(
        width: 350,
        height: 40,
        child: TextField(
          decoration: InputDecoration(
              fillColor: Color.fromARGB(164, 255, 255, 255),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              prefixIcon: Icon(Icons.search_outlined)),
        ),
      ),
    );
  }
}

class StudentsAll {
  static List _suggest = [
    'person0',
    'person2',
    'person3',
    'person4',
    'person5',
  ];
}

class HomeInkwell extends StatefulWidget {
  const HomeInkwell({Key? key, required this.school}) : super(key: key);

  @override
  State<HomeInkwell> createState() => _HomeInkwellState();
  final String school;
}

class _HomeInkwellState extends State<HomeInkwell> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 89, 154, 252),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          shadowColor: Colors.transparent),
      child: Text(
        widget.school,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class HomeBigButton extends StatefulWidget {
  const HomeBigButton({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeBigButton> createState() => _HomeBigButtonState();
}

class _HomeBigButtonState extends State<HomeBigButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(90, 127, 255, 1),
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 17.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          shadowColor: Colors.transparent,
        ),
        onPressed: () {},
        child: Text(
          "Randevu Al",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
