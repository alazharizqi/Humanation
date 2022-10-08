import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:humanation/admin/controller/listleavecontroller.dart';
import 'package:humanation/admin/detail/detailcuti.dart';
import 'package:humanation/admin/homeadmin.dart';
import 'package:humanation/fitur/perizinan.dart';

class ListLeave extends GetView<leavecontroller> {
  @override
  Widget build(BuildContext context) {
    Get.put(leavecontroller());

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Perizinan'),
        backgroundColor: Color(0xFFFF725E),
      ),
      body: FutureBuilder<QuerySnapshot<Object?>>(
          future: controller.getData(),
          builder: (context, snapshot) {
            var listAllDocs = snapshot.data!.docs;
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: listAllDocs.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () => Get.toNamed("/detailcuti",
                      arguments: listAllDocs[index].id),
                  // trailing: ElevatedButton(
                  //   onPressed: () {},
                  //   child: Wrap(
                  //     children: <Widget>[
                  //       Icon(
                  //         Icons.arrow_circle_right,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  title: Text(
                      "${(listAllDocs[index].data() as Map<String, dynamic>)["Email"]}"),
                  subtitle: Text(
                      "Jenis izin :  ${(listAllDocs[index].data() as Map<String, dynamic>)["Jenis Cuti"]}"),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
