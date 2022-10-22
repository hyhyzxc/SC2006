import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class PlansCrematoria extends StatefulWidget {
  const PlansCrematoria({Key? key}) : super(key: key);
  static const String routeName = '/crematorium-plans';

  @override
  State<PlansCrematoria> createState() => _PlansCrematoriaState();
}

class _PlansCrematoriaState extends State<PlansCrematoria> {

  final db = FirebaseFirestore.instance;
  Stream<QuerySnapshot<Object?>> getCrematoriaSnapshots(BuildContext context) async* {

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final String uid = user!.uid;
    yield* db.collection('userData').doc(uid).collection('Crematoria').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Crematoria Plans"),
        backgroundColor: Colors.blueGrey[300],),
        body: StreamBuilder(
          stream: getCrematoriaSnapshots(context),
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
            color: Colors.orange[100],
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 5, right: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child:
                      Text(data!['name'], style: new TextStyle(fontSize: 20.0, fontFamily: "Varela", fontWeight: FontWeight.bold),overflow: TextOverflow.clip,),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 5, right: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      child:
                      Text(
                        "${data!['address']} ", style: new TextStyle(fontSize: 15.0, fontFamily: "Varela", color: Colors.black38),
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.left,),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 5, right: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      child:
                      Text(
                        "${data!['package']}", style: new TextStyle(fontSize: 15.0, fontFamily: "Varela"),
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.left,),

                    ),
                  ),
                  SizedBox(height:5,),
                  Divider(color: Colors.orange[500], thickness: 0.6,),
                  SizedBox(height:5,),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 5, right: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      child:
                      Text(
                        "Appointment Booking:", style: new TextStyle(fontSize: 15.0, fontFamily: "Varela"),
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.left,),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 5, right: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      child: Row( children: [
                        Icon(Icons.calendar_today_outlined, color: Colors.orange[500]),
                        SizedBox(width: 8,),
                        Text(
                          "${data!['appt_date']} ", style: new TextStyle(fontSize: 15.0, fontFamily: "Varela", color: Colors.black45),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,),
                        SizedBox(width: 40,),
                        Icon(Icons.timer_outlined, color: Colors.orange[500]),
                        SizedBox(width: 8,),
                        Text(
                          "${data!['appt_time']} ", style: new TextStyle(fontSize: 15.0, fontFamily: "Varela", color: Colors.black45),
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