import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:next_stage/main.dart';
//import 'package:next_stage/models/deathcert_doctor.dart';
//import 'package:next_stage/models/obituary.dart';
import 'package:next_stage/models/obituaryform.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:next_stage/screens/Obituary/obituary_form.dart';

import '../../models/obituaryPlan.dart';

class ObituaryConfirm extends StatefulWidget {
  final Trip trip;

  final NewspaperData newspaper;
  //ObituaryConfirm({Key? key, required this.trip}) : super(key: key);
  ObituaryConfirm({Key? key, required this.trip, required this.newspaper}) : super(key: key);

  @override
  State<ObituaryConfirm> createState() => _ObituaryConfirmState();
}

class _ObituaryConfirmState extends State<ObituaryConfirm> {
  final db = FirebaseFirestore.instance;

  var productName = "";
  // NewspaperData? newspaper;
  Future<String>saveObituaryPlan({required ObituaryPlan obituary}) async {
    final docUser = FirebaseFirestore.instance.collection('Obituary').doc();
    final json = obituary.getJson();
    await docUser.set(json);
    return docUser.id;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.trip.newspaper),),
      backgroundColor: Colors.lightGreen[200],
      body: ListView(
        children: <Widget> [
          Padding(padding: const EdgeInsets.all(10.0)),
          Center(
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.verified_outlined,
                      color: Colors.pink,
                      size: 65.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Confirmation',

                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(widget.trip!.name,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: List.generate(400~/5, (index) => Expanded(
                            child: Container(
                              color: index%2==0?Colors.transparent
                                  :Colors.grey,
                              height: 2,
                            ),
                          )),
                        ),

                      ],
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Name',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        Text(
                          widget.trip!.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: List.generate(400~/5, (index) => Expanded(
                            child: Container(
                              color: index%2==0?Colors.transparent
                                  :Colors.grey,
                              height: 2,
                            ),
                          )),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Date of Death',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        Text(
                          widget.trip!.dateofdeath,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: List.generate(400~/5, (index) => Expanded(
                            child: Container(
                              color: index%2==0?Colors.transparent
                                  :Colors.grey,
                              height: 2,
                            ),
                          )),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Location of Wake',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        Text(
                          widget.trip!.locationofwake,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: List.generate(400~/5, (index) => Expanded(
                            child: Container(
                              color: index%2==0?Colors.transparent
                                  :Colors.grey,
                              height: 2,
                            ),
                          )),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Funeral Date',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        Text(
                          widget.trip!.funeraldate,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: List.generate(400~/5, (index) => Expanded(
                            child: Container(
                              color: index%2==0?Colors.transparent
                                  :Colors.grey,
                              height: 2,
                            ),
                          )),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Funeral Time',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        Text(
                          widget.trip!.funeraltime,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: List.generate(400~/5, (index) => Expanded(
                            child: Container(
                              color: index%2==0?Colors.transparent
                                  :Colors.grey,
                              height: 2,
                            ),
                          )),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Names of Deceased Family',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        Text(
                          widget.trip!.familynames,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: List.generate(400~/5, (index) => Expanded(
                            child: Container(
                              color: index%2==0?Colors.transparent
                                  :Colors.grey,
                              height: 2,
                            ),
                          )),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Center(
              child: InkWell(

                  child:Container(
                      width: MediaQuery.of(context).size.width - 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Color(0xFFF17532)
                      ),
                      child: Center(
                          child: Text('Call ' + widget.trip.phone,
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
                    _callNumber(widget.trip.phone);
                  }
              )
          ),
          SizedBox(height: 20.0),
          Center(
              child: Container(
                  width: MediaQuery.of(context).size.width - 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color(0xFFF17532)
                  ),
                  child: ElevatedButton(
                      child: Text('Add to plans',
                        style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                      onPressed: () async {
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        final User? user = auth.currentUser;
                        final String uid = user!.uid;
                        ObituaryPlan obituary = ObituaryPlan(
                            user_id: uid,
                            deceased_name: widget.trip.name,
                            date_of_death: widget.trip.dateofdeath,
                            location_of_wake: widget.trip.locationofwake,
                            funeral_date: widget.trip.funeraldate,
                            funeral_time: widget.trip.funeraltime,
                            names_of_family: widget.trip.familynames);
/**/
                        String docID = await saveObituaryPlan(obituary: obituary);

                        final planData = FirebaseFirestore.instance.collection('Plan').doc(uid);
                        final snapshot = await planData.get();
                        print(docID);
                        if (snapshot.exists) {
                          planData.update({
                            'obituaryPlanID': docID!,
                          });
                        } else {
                          print("Error: cannot find Plan");
                        }
                        _showMyDialog();

                      }
                  )
              )
          ),
          SizedBox(height: 20.0),
        ],

      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notification'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Plan saved successfully'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Go back to Home Page'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ],
        );
      },
    );
  }
}

_callNumber(String phoneNumber) async {
  String number = phoneNumber;
  await FlutterPhoneDirectCaller.callNumber(number);
}