import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class tambahprofileInformasiPengguna extends StatelessWidget {
  const tambahprofileInformasiPengguna({Key? key}) : super(key: key);

  static const String _title = "Edit Profile Informasi Pengguna";

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          leading: IconButton(
            icon: Icon(Icons.perm_device_information_outlined,
                color: Colors.white),
            onPressed: () {},
          ),
        ),
        body: Container(
          child: tmbhprofile(),
        ),
      ),
    );
  }
}

class tmbhprofile extends StatefulWidget {
  const tmbhprofile({Key? key}) : super(key: key);

  @override
  State<tmbhprofile> createState() => _tmbhprofileState();
}

class _tmbhprofileState extends State<tmbhprofile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(8, 15, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text('Nama Lengkap',
                    style: new TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue)),
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextField(),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 15, 0, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text('Jenis Kelamin',
                  style: new TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextField(),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 15, 0, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text('Tanggal Lahir',
                  style: new TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextField(),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 15, 0, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text('Domisili Provinsi',
                  style: new TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextField(),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 15, 0, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text('Domisili Kota',
                  style: new TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextField(),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 15, 0, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text('Domisili Kecamatan',
                  style: new TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextField(),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 15, 0, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text('Kode pos',
                  style: new TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextField(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton(onPressed: () {}, child: Text('Kirim')),
          ),
        ),
      ],
    );
  }
}
