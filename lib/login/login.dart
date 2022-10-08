import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humanation/admin/homeadmin.dart';
import 'package:humanation/auth_service.dart';
import 'package:humanation/register/register.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailC = TextEditingController();
    final TextEditingController passwordC = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFFF725E),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Selamat datang,",
                    style: GoogleFonts.mcLaren(
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Login !",
                    style: GoogleFonts.mcLaren(
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 40)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 100,
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(),
                                child: TextField(
                                  controller: emailC,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Email',
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(),
                                child: TextFormField(
                                  obscureText: true,
                                  controller: passwordC,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Password',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text(
                                  "Belum punya akun ?",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  register()));
                                    },
                                    child: Text('Daftar'))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xFFFF725E)),
                                  onPressed: () {
                                    AuthServices.login(
                                            emailC.text, passwordC.text)
                                        .then((value) => Navigator.of(context)
                                                .push(MaterialPageRoute(
                                                    builder: (context) {
                                              return MyStatefulWidget();
                                            })))
                                        .catchError(
                                            (e) => print('error login'));
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(color: Color(0xffffffff)),
                                  )),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
