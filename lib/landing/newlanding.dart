import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:humanation/login/login.dart';
import 'package:humanation/register/register.dart';

class NewLanding extends StatelessWidget {
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
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF050a30),
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
            child: Text(
              'Humanation',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
            child: Text(
              'Sign your application today',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce condimentum, nibh in euismod maximus, quam nibh convallis nibh, et dapibus enim velit vitae enim. Etiam congue ligula in nunc iaculis, quis semper sapien bibendum. Ut at fermentum nibh. Ut nec ligula lacus. Pellentesque sodales porta ullamcorper. Suspendisse ultrices, nunc at pellentesque efficitur, quam orci pulvinar elit, pulvinar fringilla lectus nulla a est.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFFF725E),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFFF725E),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const register()),
                );
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: SvgPicture.asset('assets/img/newlanding.svg'),
          ),
        ],
      ),
    );
  }
}
