import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:humanation/admin/homeadmin.dart';
import 'package:humanation/login/login.dart';

class Landing extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Humanation',
      theme: ThemeData(),
      home: Scaffold(
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Container(
            alignment: Alignment.topRight,
            child: TextButton(
              child: Text('Kembali', style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(backgroundColor: Color(0xFFFF725E)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyStatefulWidget()));
              },
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        SvgPicture.asset('assets/img/landingimg.svg'),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Apa itu humanation ?',
                  style: TextStyle(fontWeight: FontWeight.bold))),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
          child: Text(
              'Humanation adalah aplikasi untuk tim divisi human resource pada suatu perusahaan, sekolah, ataupun organisasi berskala kecil maupun besar'),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Apa kegunaan aplikasi Humanation ?',
                  style: TextStyle(fontWeight: FontWeight.bold))),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
          child: Text(
              'Kegunaan aplikasi Humanation adalah kita sebagai user bisa melihat profil diri, melihat riwayat pekerjaan, mengajukan cuti dan melihat riwayat cuti.'),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Founder, by team Humanation')),
        ),
        SizedBox(height: 75),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Container(
              alignment: Alignment.center, child: Text('Copyright, 2022')),
        ),
      ],
    );
  }
}
