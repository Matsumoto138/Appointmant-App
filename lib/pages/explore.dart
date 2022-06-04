// ignore_for_file: prefer_const_literals_to_create_immutables, unused_local_variable

import 'dart:html';

import 'package:appointment_app/pages/home.dart';
import 'package:appointment_app/pages/suggest_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final _firestore = FirebaseFirestore.instance;
  final String title = "Keşfet";
  @override
  Widget build(BuildContext context) {
    String nameFatih;
    String nameMerve;
    String nameTurkay;
    String nameEsra;
    String nameOmer;
    String bolumFatih;
    String bolumMerve;
    String bolumTurkay;
    String bolumEsra;
    String bolumOmer;
    CollectionReference volunteersRef = _firestore.collection('volunteers');
    var fatihRef = volunteersRef.doc('NlHP3YrPl3220u63sRyG');
    getData() async {
      var response = await fatihRef.get();
      dynamic mapFatih = response.data();
      nameFatih = mapFatih['isim'];
      bolumFatih = mapFatih['bölüm'];
    }

    ;

    getData();
    return Scaffold(
      appBar: GlobalAppBar(text: title),
      body: Container(
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
            // ignore: prefer_const_constructors
            // gradient: LinearGradient(
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //     stops: [0.01, 0.3],
            //     colors: [Colors.white, Color.fromRGBO(140, 201, 220, 1)])
            color: Colors.white70),
        child: StreamBuilder<Object>(
            stream: volunteersRef.snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(children: [
                // ElevatedButton(
                //     onPressed: () async {
                //       var response = await volunteersRef.get();
                //       var list = response.docs;
                //       print(list.first.data());
                //     },
                //     child: const Text('Görüntüle')),
                Expanded(
                  child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: snapshot.data.documents.map((document) {
                        HomePopUp(
                            srcImage: 'assets/images/cv_img.png',
                            name: document['isim'],
                            degree: document['bölüm']);
                        // ignore: prefer_const_constructors
                      })
                      // ignore: prefer_const_constructors

                      ),
                )
              ]);
            }),
      ),
    );
  }
}
