import 'package:appointment_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:appointment_app/pages/suggest_card.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView(
      {Key? key,
      required this.srcImage,
      required this.name,
      required this.degree})
      : super(key: key);
  final String srcImage;
  final String name;
  final String degree;
  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  final String title = "Randevularım";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(),
      appBar: GlobalAppBar(text: title),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.01, 0.3],
                  colors: [Colors.white, Color.fromRGBO(140, 201, 220, 1)])),
          child: Column(
            children: [
              Center(child: HomeSearchBar()),
              AppointmentWidget(
                  srcImage: widget.srcImage,
                  name: widget.name,
                  degree: widget.degree),
            ],
          )),
    );
  }
}

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget(
      {Key? key,
      required this.srcImage,
      required this.name,
      required this.degree})
      : super(key: key);
  final String srcImage;
  final String name;
  final String degree;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(srcImage),
            ),
          ),
          Container(
            child: Column(
              children: [Text(name), Text(degree)],
            ),
          )
        ],
      ),
    );
  }
}
