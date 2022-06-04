import 'package:appointment_app/pages/accept.dart';
import 'package:appointment_app/pages/appointment.dart';
import 'package:appointment_app/pages/home.dart';
import 'package:flutter/material.dart';

class HomeCardView extends StatefulWidget {
  final String srcImage;
  final String name;
  final String degree;
  HomeCardView(
      {required this.srcImage, required this.name, required this.degree});

  @override
  State<HomeCardView> createState() => _HomeCardViewState();
}

class _HomeCardViewState extends State<HomeCardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white60,
      ),
      width: 250,
      height: 130,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    width: 100,
                    height: 130,
                    child: Image.asset(
                      widget.srcImage,
                      fit: BoxFit.cover,
                    ))),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: InkWell(
                        onTap: () => {simpleDialog(context)},
                        child: Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )),
                  Text(
                    widget.degree,
                    style: TextStyle(
                        color: Color.fromARGB(255, 107, 107, 107),
                        fontSize: 12),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void simpleDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              actions: [
                HomePopUp(
                    srcImage: widget.srcImage,
                    name: widget.name,
                    degree: widget.degree)
              ],
            ));
  }
}

class HomePopUp extends StatefulWidget {
  const HomePopUp(
      {Key? key,
      required this.srcImage,
      required this.name,
      required this.degree})
      : super(key: key);
  final String srcImage;
  final String name;
  final String degree;
  @override
  State<HomePopUp> createState() => _HomePopUpState();
}

class _HomePopUpState extends State<HomePopUp> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 300,
        width: 300,
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white70,
        ),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      widget.srcImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                widget.name,
                style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 1.5,
                    height: 2,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  widget.degree,
                  style: TextStyle(
                      fontSize: 18, height: 2, fontWeight: FontWeight.w400),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Accept()));
                },
                child: Text("Randevu Al"),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 89, 154, 252),
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.all(14)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
