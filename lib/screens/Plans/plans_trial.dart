import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:next_stage/models/deathcert_doctor.dart';
import 'package:next_stage/models/funeralparlor.dart';
import 'package:next_stage/screens/DeathCert/deathcert_doctordetail.dart';
import 'package:next_stage/screens/Obituary/obituary_form.dart';
import 'dart:convert';
/**/
import '../../models/obituaryPlan.dart';
import '../../models/plan.dart';

class PlansTrial extends StatefulWidget {
  const PlansTrial({Key? key}) : super(key: key);
  static const String routeName = '/plans-trial';

  @override
  State<PlansTrial> createState() => _PlansTrialState();
}

class _PlansTrialState extends State<PlansTrial> {

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
        appBar: AppBar(title: Text("View Crematoria plans"),),
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
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child:
                  Text(data!['name'], style: new TextStyle(fontSize: 30.0),overflow: TextOverflow.clip,),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 80.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,

                  child:
                  Text(
                      "${data!['appt_date']} - \n${data!['package']} ", style: new TextStyle(fontSize: 35.0),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.left,),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(data!['appt_time'], style: new TextStyle(fontSize: 20.0),overflow: TextOverflow.clip,),
                    Spacer(),
                    Icon(Icons.directions_car),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
