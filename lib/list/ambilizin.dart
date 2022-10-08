import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ambilizin extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void ambildataizin() async {
    final results = await firestore
        .collection("izin")
        // .where("Email", isEqualTo: "adrian@test.com")
        .get();
    // print(results.docs);
    results.docs.forEach((element) {
      var id = element.id;
      var data = element.data();
      print("Id : $id");
      print("Data : $data");
    });
  }
}
