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
      appBar: AppBar(title: Text(product!.name),
      backgroundColor: Colors.green[200],),
      body: ListView(
          padding: EdgeInsets.all(10.0),
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.green[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                  bottom: Radius.circular(0),),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/images/willlawyer.jfif'),
                        fit: BoxFit.cover
                    )
                ),
              ),

            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(0),
                      bottom: Radius.circular(20),
                    ),
                    color: Colors.green[50]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
            Center(
              child: Text(product!.name,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[500],)),
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
                      color: Colors.green[500],)
                ),
              ),
            ),
            SizedBox(height: 10,),
            ],)),
            SizedBox(height: 20,),
            Spacer(),
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
                            color: Colors.green[200],
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
            SizedBox(height: 20.0),
          ]
      ),
    );

  }
}

_callNumber(String phoneNumber) async {
  String number = phoneNumber;
  await FlutterPhoneDirectCaller.callNumber(number);
}