import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class leavecontroller extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference listleave = firestore.collection("izin");

    return listleave.get();
  }
}
