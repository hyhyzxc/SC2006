import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class PlansFuneral extends StatefulWidget {
  const PlansFuneral({Key? key}) : super(key: key);
  static const String routeName = '/funeral-plans';

  @override
  State<PlansFuneral> createState() => _PlansFuneralState();
}

class _PlansFuneralState extends State<PlansFuneral> {

  int count=0;

  final db = FirebaseFirestore.instance;
  Stream<QuerySnapshot<Object?>> getFuneralSnapshots(BuildContext context) async* {

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final String uid = user!.uid;
    yield* db.collection('userData').doc(uid).collection('Funeral').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Funeral Plans"),
      backgroundColor: Colors.blueGrey[300],),
      body: StreamBuilder(
          stream: getFuneralSnapshots(context),
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
                  Text('Plan Successfully Deleted!'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Return'),
                onPressed: ()  {
                  count=0;
                  Navigator.popUntil(context, (route) {
                    return count++ == 2;
                  });
                },
              ),
            ],
          );
        },
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
                  Text('Are you sure that you want to delete this plan?'),
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
                  String docID = data.id;
                  final db = FirebaseFirestore.instance;
                  db.collection('userData').doc(uid).collection('Funeral').doc(docID).delete();

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
    return new Container(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10,10,10,0),
        child:
      Card(
        color: Colors.blue[100],
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 4.0, left: 5, right: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,

                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: Text(data!['name'], style: new TextStyle(fontSize: 20.0, fontFamily: "Varela", fontWeight: FontWeight.bold),overflow: TextOverflow.clip,),),
                        IconButton(
                            onPressed: () {
                              _showMyDialog();
                            },
                            icon: Icon(Icons.delete, color: Colors.red[800],))
                      ]),

                ),),
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
                    "${data!['description']} ", style: new TextStyle(fontSize: 15.0, fontFamily: "Varela"),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.left,),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 5, right: 5),
                 child: Row(
                    children: <Widget>[
                      for(int x = int.parse(data!['rating']); x>0; x--)...[
                        Container(
                            child: Icon(Icons.star, color: Colors.yellow[200],),
                        ),
                      ],
                    ],
                  ),
              )
            ],
          ),
        ),
      )),
    );
  }
}