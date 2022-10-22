import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class PlansWill extends StatefulWidget {
  const PlansWill({Key? key}) : super(key: key);
  static const String routeName = '/will-plans';

  @override
  State<PlansWill> createState() => _PlansWillState();
}

class _PlansWillState extends State<PlansWill> {

  final db = FirebaseFirestore.instance;
  Stream<QuerySnapshot<Object?>> getWillSnapshots(BuildContext context) async* {

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final String uid = user!.uid;
    yield* db.collection('userData').doc(uid).collection('Will').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Will Plans"),
          backgroundColor: Colors.blueGrey[300]),
      body: StreamBuilder(
          stream: getWillSnapshots(context),
          builder: (BuildContext context, snapshot) {
            if(!snapshot.hasData) return const Text("Loading...");
            return new ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildPlanCard(context, snapshot.data!.docs[index]));
          }
      ),
    );
  }

  Widget buildPlanCard(BuildContext context, DocumentSnapshot  data) {
    return new Container(
      child: Container(
          padding: const EdgeInsets.fromLTRB(10,10,10,0),
          child:
          Card(
            color: Colors.green[100],
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 4.0, left: 5, right: 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      child: Row( children: [
                        Text(data!['tester_name'], style: new TextStyle(fontSize: 20.0, fontFamily: "Varela", fontWeight: FontWeight.bold),overflow: TextOverflow.clip,),
                        Spacer(),
                        IconButton(
                            onPressed: () {

                            },
                            icon: Icon(Icons.edit, color: Colors.green[500],))
                      ]),

                    ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 5, right: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      child:
                      Text(
                        "${data!['type_of_assets']} ", style: new TextStyle(fontSize: 15.0, fontFamily: "Varela", color: Colors.black38),
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.left,),

                    ),
                  ),
                  SizedBox(height:5,),
                  Divider(color: Colors.green[500], thickness: 0.6,),
                  SizedBox(height:5,),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 5, right: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      child: Row( children: [
                        Text(
                          "Executor & Trustee:", style: new TextStyle(fontSize: 15.0, fontFamily: "Varela"),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,),
                        SizedBox(width: 8,),
                        Text(
                          "${data!['executor_and_trustee']} ", style: new TextStyle(fontSize: 15.0, fontFamily: "Varela", color: Colors.black45),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,),
                      ]),

                    ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 5, right: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      child: Row( children: [
                        Text(
                          "Executor:", style: new TextStyle(fontSize: 15.0, fontFamily: "Varela"),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,),
                        SizedBox(width: 8,),
                        Text(
                          "${data!['executor_1']} ", style: new TextStyle(fontSize: 15.0, fontFamily: "Varela", color: Colors.black45),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,),
                      ]),

                    ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 5, right: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      child: Row( children: [
                        Text(
                          "Substitute Executor:", style: new TextStyle(fontSize: 15.0, fontFamily: "Varela"),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,),
                        SizedBox(width: 8,),
                        Text(
                          "${data!['substitute_executor']} ", style: new TextStyle(fontSize: 15.0, fontFamily: "Varela", color: Colors.black45),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,),
                      ]),

                    ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 5, right: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      child: Row( children: [
                        Text(
                          "Specific Gifts:", style: new TextStyle(fontSize: 15.0, fontFamily: "Varela"),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,),
                        SizedBox(width: 8,),
                        Text(
                          "${data!['specific_gifts']} ", style: new TextStyle(fontSize: 15.0, fontFamily: "Varela", color: Colors.black45),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,),
                      ]),

                    ),)
                ],
              ),
            ),
          )),
    );
  }
}