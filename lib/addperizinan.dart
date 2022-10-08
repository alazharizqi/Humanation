import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class addperizinan {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void tambahperizinan(
      String jenis, String deskripsi, String tanggalawal, String tanggalakhir) {
    CollectionReference perizinan = firestore.collection("perizinan");

    try {
      perizinan.add({
        "jenis": jenis,
        "deskripsi": deskripsi,
        "tanggalawal": tanggalawal,
        "tanggalakhir": tanggalakhir,
      });
      print(tambahperizinan);
    } catch (e) {
      print(e);
    }
  }
}
