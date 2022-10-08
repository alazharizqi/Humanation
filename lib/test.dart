import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class test {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void onPressed() async {
    final results = await firestore
        .collection("izin")
        .where("Jenis Cuti", isEqualTo: "Cuti")
        .get();
  }
}
