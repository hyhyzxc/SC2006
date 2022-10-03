
import 'package:flutter/material.dart';
import 'package:next_stage/screens/googleMap.dart';

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
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: FloatingActionButton(
            child: Text("Google Maps"),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => MapSample()));
            },
          )
        ),
      ),
    );
  }
}