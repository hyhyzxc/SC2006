import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class WillFill extends StatefulWidget {
  static const String routeName = '/fill-will';

  const WillFill({Key? key}) : super(key: key);

  @override
  _WillFillState createState() => _WillFillState();
}


class _WillFillState extends State<WillFill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Formalities of a Will'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/Formalities of a will.PNG'),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: 350.0,
              child: ElevatedButton(
                onPressed: () {
                  //Navigator.pushNamed(context,'/willFilling');
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}