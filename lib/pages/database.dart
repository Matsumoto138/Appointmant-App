// import 'package:cloud_firestore/cloud_firestore.dart';

// class Database {
//   late FirebaseFirestore firestore;
//   initiliase() {
//     firestore = FirebaseFirestore.instance;
//   }

//   Future<List> read() async {
//     QuerySnapshot querySnapshot;
//     List docs = [];
//     try {
//       querySnapshot = await firestore.collection('volunteers').get();
//       if (querySnapshot.docs.isNotEmpty) {
//         for (var doc in querySnapshot.docs.toList()) {
//           Map a = {"id": doc.id, "name": doc['isim'], "bölüm": doc['bölüm']};
//           docs.add(a);
//         }
//         return docs;
//       }
//     } catch (e) {
//       print(e);
//       return [];
//     }
//   }
// }
