import 'package:flutter/material.dart';

class ConfirmRole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Confirm Role',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Confirmation Form',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Body(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: 'User',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          selectedItemColor: Color(0xFFFF725E),
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String dropDown = 'Test';
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Container(
              alignment: Alignment.centerLeft, child: Text('Confrim Role as')),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              child: DropdownButton<String>(
                items: <String>['A', 'B', 'C', 'D'].map((String dropDown) {
                  return DropdownMenuItem<String>(
                    value: dropDown,
                    child: Text(dropDown),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Checkbox(
                checkColor: Colors.white,
                value: value,
                onChanged: (bool? value) {
                  setState(() {
                    value = value!;
                  });
                },
              ),
            ),
            Text('Agree with Terms & Condition'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
              child: Text('Submit', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0xFFFF725E),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
