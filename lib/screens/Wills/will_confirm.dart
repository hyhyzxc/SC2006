import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:next_stage/screens/Wills/willFilling.dart';
import 'package:next_stage/models/willform.dart';

class WillConfirm extends StatefulWidget {
  final Trip trip;

  WillConfirm({Key? key, required this.trip}) : super(key: key);

  @override
  State<WillConfirm> createState() => _WillConfirmState();
}

class _WillConfirmState extends State<WillConfirm> {
  final db = FirebaseFirestore.instance;

  var productName = "";
  LawyerData? lawyer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Will')),
          backgroundColor: Colors.lightGreen[200],
          body: ListView(
            children: <Widget>[
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
                              'Will Confirmation',

                              textAlign: TextAlign.center,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline5,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: List.generate(400 ~/ 5, (index) =>
                                  Expanded(
                                    child: Container(
                                      color: index % 2 == 0 ? Colors.transparent
                                          : Colors.grey,
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
                              'Tester Name',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                            Text(
                              widget.trip!.tester,
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
                              children: List.generate(400 ~/ 5, (index) =>
                                  Expanded(
                                    child: Container(
                                      color: index % 2 == 0 ? Colors.transparent
                                          : Colors.grey,
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
                              'Executor and Trustee',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                            Text(
                              widget.trip!.executorAndTrustee,
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
                              children: List.generate(400 ~/ 5, (index) =>
                                  Expanded(
                                    child: Container(
                                      color: index % 2 == 0 ? Colors.transparent
                                          : Colors.grey,
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
                              'Type of Assets',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                            Text(
                              widget.trip!.typeOfAssets,
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
                              children: List.generate(400 ~/ 5, (index) =>
                                  Expanded(
                                    child: Container(
                                      color: index % 2 == 0 ? Colors.transparent
                                          : Colors.grey,
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
                              'Executor 1',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                            Text(
                              widget.trip!.executor1,
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
                              children: List.generate(400 ~/ 5, (index) =>
                                  Expanded(
                                    child: Container(
                                      color: index % 2 == 0 ? Colors.transparent
                                          : Colors.grey,
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
                              'Substitute Executors',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                            Text(
                              widget.trip!.substituteExecutor,
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
                              children: List.generate(400 ~/ 5, (index) =>
                                  Expanded(
                                    child: Container(
                                      color: index % 2 == 0 ? Colors.transparent
                                          : Colors.grey,
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
                              'Specific Gifts',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                            Text(
                              widget.trip!.gifts,
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
                              children: List.generate(400 ~/ 5, (index) =>
                                  Expanded(
                                    child: Container(
                                      color: index % 2 == 0 ? Colors.transparent
                                          : Colors.grey,
                                      height: 2,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                  child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Color(0xFFF17532)
                      ),
                      child:  Center(
                          child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width - 50.0,
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
                                    WillPlan obituary = ObituaryPlan(
                                        user_id: uid,
                                        deceased_name: widget.trip.name,
                                        date_of_death: widget.trip.dateofdeath,
                                        location_of_wake: widget.trip.locationofwake,
                                        funeral_date: widget.trip.funeraldate,
                                        funeral_time: widget.trip.funeraltime,
                                        names_of_family: widget.trip.familynames);
/**/
                                    String docID = await saveObituaryPlan(
                                        obituary: obituary);

                                    final planData = FirebaseFirestore.instance.collection(
                                        'Plan').doc(uid);
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
                  )
              ),
              SizedBox(height: 20.0),
            ],
          ),
      );
    }
}

_callNumber(String phoneNumber) async {
  String number = phoneNumber;
  await FlutterPhoneDirectCaller.callNumber(number);
}