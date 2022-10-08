import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:humanation/test.dart';

class ListEmployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home User',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Color(0xFFFF725E),
          title: const Text(
            'Daftar Karyawan',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: MainApp(),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      children: [
        ListTile(
          title: Text(" ${FirebaseAuth.instance.currentUser!.email}"),
          subtitle: Text("Jenis perizinan"),
          leading: CircleAvatar(
            backgroundColor: Color(0xFFFF725E),
          ),
          trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFF725E),
              ),
              onPressed: () {},
              child: Icon(Icons.arrow_circle_right_rounded)),
        ),
        Divider(
          color: Colors.black12,
        ),
      ],
    ));
  }
}
