import 'dart:convert';

import 'package:flutter/material.dart';


class DeathAtHospital extends StatefulWidget {
  const DeathAtHospital({ Key? key }) : super(key: key);

  static const String routeName = '/doctor-at-hospital';

  @override
  _DeathAtHospitalState createState() => _DeathAtHospitalState();
}

class _DeathAtHospitalState extends State<DeathAtHospital> {

  @override
  Widget build(BuildContext context) {

    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: TextStyle(
        fontFamily: 'Varela',
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Colors.white
    ));

    return Scaffold(
      appBar: AppBar(title: Text("Death At Hospital"),),
      body: ListView(
          children: [
            SizedBox(height: 0.0),
            Center(
                child: Image.asset('assets/images/death_at_home.jpg',
                    height: 300.0,
                    width: 500.0,
                    fit: BoxFit.fitWidth
                )
            ),
            SizedBox(height: 50.0),
            Center(
              child: Text("Instructions",
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text("Step 1: \n Download Digital Death Certificate \n\n "
                    "Step 2: \n Engage a Funeral Director \n\n "
                    "Step 3: \n Application for Permit to Bury/Cremate (this can be done concurrently with Step 2)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16.0,
                        color: Color(0xFFB4B8B9))
                ),
              ),
            ),
          ]
      ),



    );
  }
}