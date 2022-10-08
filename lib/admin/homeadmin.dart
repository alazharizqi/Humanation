import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:humanation/admin/detail/detailcuti.dart';
import 'package:humanation/admin/listleave.dart';
import 'package:humanation/fitur/perizinan.dart';
import 'package:humanation/landing/landing_screen.dart';
import 'package:humanation/login/login.dart';
import 'package:humanation/profile/informasiperusahaan.dart';

import '../auth_service.dart';
import '../profile/informasipengguna.dart';
import '../profile/informasipribadi.dart';
import '../settings/settings.dart';
import '../user/userprofile.dart';
import 'listemployee.dart';
import 'package:humanation/fitur/perizinan.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    BodyHomeAdmin(),
    UserProfiles(),
    SettingButton(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'User',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFF725E),
        onTap: _onItemTapped,
      ),
    );
  }
}

class BodyHomeAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Text(
          'Selamat Datang !',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Container(
              child: SvgPicture.asset('assets/img/home.svg',
                  height: 235,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 30, 0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListEmployee()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFF725E),
                ),
                icon: Icon(
                  // <-- Icon
                  Icons.supervised_user_circle_outlined,
                  size: 24.0,
                ),
                label: Text('Daftar Karyawan'), // <-- Text
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListLeave()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFF725E),
                ),
                icon: Icon(
                  // <-- Icon
                  Icons.message_rounded,
                  size: 24.0,
                ),
                label: Text('Daftar Perizinan'), // <-- Text
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        // kotak oren
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => perizinan()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFFF725E),
            ),
            icon: Icon(
              // <-- Icon
              Icons.add,
              size: 24.0,
            ),
            label: Text('Ajukan Perizinan'), // <-- Text
          ),
        ),
      ],
    );
  }
}

class SettingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xFFFF725E),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Pilih bahasa'),
                    content: Container(
                      height: 100,
                      width: 300,
                      child: Column(
                        children: [
                          TextButton(
                              onPressed: () {}, child: Text('Indonesia')),
                          TextButton(onPressed: () {}, child: Text('English')),
                        ],
                      ),
                    ),
                  ),
                ),
                child: Icon(Icons.arrow_right),
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.language_rounded),
                    onPressed: () {},
                  );
                },
              ),
              title: Text('Ganti bahasa'),
            ),
          ),
          Card(
            child: ListTile(
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Landing()),
                  );
                },
                child: Icon(Icons.arrow_right),
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.account_box_outlined),
                    onPressed: () {},
                  );
                },
              ),
              title: Text('Tentang humanation'),
            ),
          ),
          Card(
            child: ListTile(
              trailing: ElevatedButton(
                child: Icon(Icons.arrow_right),
                onPressed: () => AuthServices.signout()
                    .then((value) => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Login();
                        })))
                    .catchError((e) => print('error signout')),
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
              title: Text('Keluar'),
            ),
          ),
        ],
      ),
    );
  }
}

class UserProfiles extends StatelessWidget {
  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(color: Color(0xFFFF725E)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                  child: Container(
                    height: 75,
                    width: 75,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/img/profile.jpg'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 35, 0, 0),
                  child: Text(
                    'Ubah Foto',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Informasi Pengguna',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xffF18265)),
                    child: Text('Ubah', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InformasiPengguna()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              width: double.infinity,
              child: Row(
                children: [
                  Align(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Tipe Akun'),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text('Tipe Akun'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Nama Lengkap'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Jenis Kelamin'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Tanggal Lahir'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Provinsi'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Kota'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Kecamatan'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Kode Pos'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Informasi Perusahaan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xffF18265)),
                    child: Text('Ubah', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InformasiPerusahaan()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Pekerjaan'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Alamat Kantor'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('No.Telepon Kantor'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Nama Keluarga yang dapat dihubungi'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('No.Telepon Keluarga'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Informasi Pengguna',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xffF18265)),
                    child: Text('Ubah', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Informasipribadi()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text("${FirebaseAuth.instance.currentUser!.email}"),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('No.Telepon'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('+628982379'),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
