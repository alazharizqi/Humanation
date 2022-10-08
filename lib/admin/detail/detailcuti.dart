import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controller/detailcuticontroller.dart';

class detailcuti extends GetView<detailcuticontroller> {
  @override
  Widget build(BuildContext context) {
    Get.put(detailcuticontroller());

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Perizinan"),
        backgroundColor: Color(0xFFFF725E),
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text(
                    'Informasi Lengkap',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 1,
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    'Email',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Text(
                    data['Email'],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 1,
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    'Jenis Cuti',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Text(
                    data['Jenis Cuti'],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 1,
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    'Tanggal Awal',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Text(
                    data['Tanggal awal'],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 1,
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    'Tanggal Akhir',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Text(
                    data['Tanggal akhir'],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 1,
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Text(
                    data['Deskripsi'],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 1,
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.grey)),
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
