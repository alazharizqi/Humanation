import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class detailcuticontroller extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("izin").doc(docID);
    return docRef.get();
  }
}
