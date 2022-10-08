import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humanation/admin/controller/listleavecontroller.dart';
import 'package:humanation/admin/detail/detailcuti.dart';
import 'package:humanation/admin/homeadmin.dart';
import 'package:humanation/admin/listleave.dart';
import 'package:humanation/fitur/perizinan.dart';
import 'package:humanation/landing/newlanding.dart';
import 'package:humanation/login/login.dart';
import 'package:humanation/register/register.dart';
import 'package:humanation/test.dart';
import 'landing/landing_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewLanding(),
      initialRoute: 'homepage',
      routes: {
        '/homepage': (context) => BodyHomeAdmin(),
        '/detailcuti': (context) => detailcuti(),
      },
    );
  }
}
