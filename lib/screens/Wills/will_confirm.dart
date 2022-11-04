import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:next_stage/screens/Wills/lawyers_search.dart';
import 'package:next_stage/screens/Wills/willFilling.dart';
import 'package:next_stage/models/willform.dart';
import '../../models/willPlan.dart';
import 'package:next_stage/screens/homePage.dart';

class WillConfirm extends StatefulWidget {
  final Trip trip;

  WillConfirm({Key? key, required this.trip}) : super(key: key);

  static const String routeName = '/willConfirm';

  @override
  State<WillConfirm> createState() => _WillConfirmState();
}

class _WillConfirmState extends State<WillConfirm> {
  final db = FirebaseFirestore.instance;

  var productName = "";
  LawyerData? lawyer;

  Future<String> saveWillPlan({required WillPlan will,required String uid}) async {
    final docUser = db.collection("userData").doc(uid).collection('Will').doc();
    final json = will.getJson();
    await docUser.set(json);
    return docUser.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Will'),
        backgroundColor: Colors.green[200],),
      backgroundColor: Colors.green[50],
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
                    color: Colors.blueGrey[300]
                ),
                child: Center(
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
                Text('Are you sure that you want to save into plans?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                final FirebaseAuth auth = FirebaseAuth.instance;
                final User? user = auth.currentUser;
                final String uid = user!.uid;
                WillPlan will = WillPlan(
                    user_id: uid,
                    tester_name: widget.trip.tester,
                    executor_and_trustee: widget.trip.executorAndTrustee,
                    type_of_assets: widget.trip.typeOfAssets,
                    executor_1: widget.trip.executor1,
                    substitute_executor: widget.trip.substituteExecutor,
                    specific_gifts: widget.trip.gifts);
                /**/
                String docID = await saveWillPlan(
                    will: will,uid: uid);


                _showMyDialogconfirm();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: ()  =>
                  Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }


  Future<void> _showMyDialogconfirm() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notification'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Plan Saved!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Go back to Home Page'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            TextButton(
              child: const Text('View Lawyers'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchLawyer()));
              },
            ),
          ],
        );
      },
    );
  }
}