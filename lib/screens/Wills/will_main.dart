import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:next_stage/models/willform.dart';
import 'package:next_stage/screens/Wills/will_confirm.dart';
import 'package:next_stage/screens/Wills/willFilling.dart';
import 'dart:convert';

import 'package:next_stage/screens/Wills/willFilling.dart';

class WillMain extends StatefulWidget {
  static const String routeName = '/willFill';

  const WillMain({Key? key}) : super(key: key);

  @override
  _WillMainState createState() => _WillMainState();
}


class _WillMainState extends State<WillMain> {
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
                  Navigator.pushNamed(context, '/willFilling');
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