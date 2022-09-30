
import 'package:flutter/material.dart';

import '../main.dart';
import 'loginPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MENU'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Logout"),
          onPressed: () {
            print("Signed Out");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => loginPage()));
          },
        ),
      ),
    );
  }
}