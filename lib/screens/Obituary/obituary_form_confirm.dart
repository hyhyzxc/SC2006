import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
//import 'package:next_stage/models/deathcert_doctor.dart';
//import 'package:next_stage/models/obituary.dart';
import 'package:next_stage/models/obituaryform.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:next_stage/screens/Obituary/obituary_form.dart';
//import 'package:next_stage/screens/Obituary/obituary_save_send.dart';

class ObituaryConfirm extends StatefulWidget {
  final obiTrip trip;

  final NewspaperData newspaper;
  ObituaryConfirm({Key? key, required this.trip, required this.newspaper}) : super(key: key);

  @override
  State<ObituaryConfirm> createState() => _ObituaryConfirmState();
}

class _ObituaryConfirmState extends State<ObituaryConfirm> {
  final db = FirebaseFirestore.instance;

  var productName = "";
  NewspaperData? newspaper;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.trip!.newspaper),),
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
                          child: Text('Call ' + widget.newspaper!.phone,
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
                    _callNumber(widget.newspaper!.phone);
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
                  child: Center(
                      child: Text('Add to plans',
                        style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      )
                  )
              )
          ),
          SizedBox(height: 20.0),
        ],

      ),
    );

    // return Scaffold(
    //     appBar: AppBar(
    //       title: Text('Confirm Particulars'),
    //     ),
    //     body: Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             Text("Particulars"),
    //             Text("Name ${trip.name}"),
    //             Text("Date of Death ${trip.dateofdeath}"),
    //             Text("Location of Wake ${trip.locationofwake}"),
    //             Text("Funeral Date ${trip.funeraldate}"),
    //             Text("Funeral Time ${trip.funeraltime}"),
    //             Text("Names of Family Members ${trip.familynames}"),
    //
    //             ElevatedButton(
    //               child: Text("Confirm"),
    //               onPressed: () async {
    //                 // save data to firebase
    //                 //await db.collection("trips").add(trip.toJson());
    //                 //Navigator.of(context).pushNamed(ObituarySaveSend.routeName);
    //                 Navigator.push(
    //                   context,
    //                   MaterialPageRoute(builder: (context) => ObituarySaveSend(trip: trip)),
    //                 );
    //                 //Navigator.of(context).popUntil((route) => route.isFirst);
    //               },
    //             ),
    //           ],
    //         )
    //     )
    // );
  }
}

_callNumber(String phoneNumber) async {
  String number = phoneNumber;
  await FlutterPhoneDirectCaller.callNumber(number);
}