import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:humanation/addperizinan.dart';
import 'package:humanation/auth_service.dart';
import 'package:intl/intl.dart';

class perizinan extends StatelessWidget {
  const perizinan({Key? key}) : super(key: key);

  static const String _title = 'Halaman Pembuatan Perizinan';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFF725E),
          title: const Text(_title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final TextEditingController jenisC = TextEditingController();
  final TextEditingController deskripsiC = TextEditingController();
  final TextEditingController tanggalawalC = TextEditingController();
  final TextEditingController tanggalakhirC = TextEditingController();
  String dropdownValue = 'Sakit';
  DateTime tanggalawal = DateTime.now();
  DateTime tanggalakhir = DateTime.now();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference perizinan = firestore.collection('izin');
    DocumentReference ref = FirebaseFirestore.instance.collection("izin").doc();
    var currentUser = FirebaseAuth.instance.currentUser;
    var email = FirebaseAuth.instance.currentUser;

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 0, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                'Pilih jenis izin',
                style: new TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFF725E)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: DropdownButton<String>(
              hint: Text("Pilih jenis cuti"),
              isExpanded: true,
              value: dropdownValue,
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Color(0xFFFF725E),
              ),
              onChanged: (newvalue) {
                setState(() {
                  dropdownValue = newvalue!;
                });
              },
              items: <String>['Sakit', 'Izin', 'Keperluan mendadak', 'Cuti']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            // child: TextField(
            //   controller: jenisC,
            //   decoration: InputDecoration(hintText: "Cuti / Sakit / Izin"),
            // ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 13, 0, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                'Tanggal awal perizinan',
                style: new TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFF725E)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(DateFormat.yMMMMd().format(tanggalawal)),
                SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: tanggalawal,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2040),
                    ).then(
                      (value) {
                        setState(() {
                          tanggalawal = value!;
                        });
                      },
                    );
                  },
                  child: Text(
                    "Pilih tanggal",
                    style: TextStyle(
                      color: Color(0xFFFF725E),
                    ),
                  ),
                ),
                // TextFormField(
                //   controller: tanggalawalC,
                //   decoration: InputDecoration(hintText: "dd / mm / yyyy"),
                // ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 15, 0, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                'Tanggal akhir perizinan',
                style: new TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFF725E)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(DateFormat.yMMMMd().format(tanggalakhir)),
                SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: tanggalakhir,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2040),
                    ).then(
                      (tanggal) {
                        setState(() {
                          tanggalakhir = tanggal!;
                        });
                      },
                    );
                  },
                  child: Text(
                    "Pilih tanggal",
                    style: TextStyle(color: Color(0xFFFF725E)),
                  ),
                ),
                // TextFormField(
                //   controller: tanggalakhirC,
                //   decoration: InputDecoration(hintText: "dd / mm / yyyy"),
                // ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 0, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                'Deskripsi perizinan',
                style: new TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFF725E)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 4, 14, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: TextField(
                controller: deskripsiC,
                minLines: 2,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 0, 0),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                  perizinan.add({
                    'Case Id': ref.id,
                    'Email': "${FirebaseAuth.instance.currentUser!.email}",
                    'Jenis Cuti': dropdownValue,
                    'Tanggal awal': tanggalawal.toIso8601String(),
                    'Tanggal akhir': tanggalakhir.toIso8601String(),
                    'Deskripsi': deskripsiC.text,
                  });

                  jenisC.text = '';
                  tanggalawalC.text = '';
                  tanggalakhirC.text = '';
                  deskripsiC.text = '';
                },
                style: ElevatedButton.styleFrom(primary: Color(0xFFFF725E)),
                child: Text(
                  'Kirim',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
