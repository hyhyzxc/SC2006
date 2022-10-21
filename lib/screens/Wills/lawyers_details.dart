import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter/material.dart';

import '../../models/lawyer.dart';


class LawyerDetail extends StatefulWidget {
  const LawyerDetail({ Key? key }) : super(key: key);

  static const String routeName = '/lawyer-detail';

  @override
  _LawyerDetailState createState() => _LawyerDetailState();
}

class _LawyerDetailState extends State<LawyerDetail> {
  final db = FirebaseFirestore.instance;

  var productName = "";
  Lawyer? product;

  Future<String> saveLawyer({required Lawyer lawyerdetails,required String uid}) async {
    final docUser = db.collection("userData").doc(uid).collection('Will').doc();
    final json = lawyerdetails.getJson();
    await docUser.set(json);
    return docUser.id;
  }

  @override
  void initState(){
    super.initState();
  }



  @override
  void didChangeDependencies() {

    var productString = ModalRoute.of(context)?.settings.arguments as String;
    print('page 2');
    print(productString);

    var productJson = jsonDecode(productString);
    print(productJson);

    setState(() {

      product = Lawyer.fromJson(productJson);

    });

    super.didChangeDependencies();
  }

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
      appBar: AppBar(title: Text(product!.name),),
      body: ListView(
          children: [
            Center(
                child: Image.asset('assets/images/willlawyer.jfif',
                    height: 300.0,
                    width: 500.0,
                    fit: BoxFit.fitHeight
                )
            ),
            SizedBox(height: 20.0),
            Center(
              child: Text(product!.name,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[300])),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(product!.firm,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 16)),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(product!.address,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 16),
                  textAlign: TextAlign.center,),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 50.0,
                child: Text("Fluent in: "+product!.fluency,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16.0,
                        color: Color(0xFFB4B8B9))
                ),
              ),
            ),
            SizedBox(height: 140.0),
            Center(
                child: InkWell(

                    child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width - 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.blueGrey[300]
                        ),
                        child: Center(
                            child: Text('Call ' + product!.phone,
                              style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            )
                        )
                    ),
                    onTap: () {
                      _callNumber(product!.phone);
                    }
                )
            ),
            SizedBox(height: 10.0),
          ]
      ),
    );

  }
}

_callNumber(String phoneNumber) async {
  String number = phoneNumber;
  await FlutterPhoneDirectCaller.callNumber(number);
}