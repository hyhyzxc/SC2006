import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateWill extends StatefulWidget {
  final String ID;
  const UpdateWill({Key? key, required this.ID}) : super(key: key,);

  static const String routeName = '/update-will';

  @override
  State<UpdateWill> createState() => _UpdateWillState();
}

class _UpdateWillState extends State<UpdateWill> {

  int count=0;

  @override
  // 1. Setting up database with Firestore database functions
  final db = FirebaseFirestore.instance;

  Future<String>saveWillPlan({required String uid, required String docID}) async {

    final docUser = db.collection("userData").doc(uid).collection(
        'Will').doc(docID);
    print(docUser);
    docUser.update({
      'tester_name': _testerController.text,
      'executor_1': _executor1Controller.text,
      'executor_and_trustee': _executorsandtrusteeController.text,
      'substitute_executor': _substituteexecutorController.text,
      'type_of_assets': _assetsPassedController.text,
      'specific_gifts': _specificgiftsController.text,
    });
    return docUser.id;
  }

  final GlobalKey<FormState> _key=GlobalKey<FormState>();

  TextEditingController _testerController = new TextEditingController();
  TextEditingController _assetsPassedController = new TextEditingController();
  TextEditingController _executorsandtrusteeController = new TextEditingController();
  TextEditingController _executor1Controller = new TextEditingController();
  TextEditingController _substituteexecutorController = new TextEditingController();
  TextEditingController _specificgiftsController = new TextEditingController();

  List<String> options=['Singapore Assets Only','Worldwide Assets Only'];
  String? selectedOption='Singapore Assets Only';

  // This is to set up the data which was routed from the last page
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Will"),
        backgroundColor: Colors.orangeAccent,),
      body:Center(
        child:ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(20,20,10,0),
                  child: const Text(
                    'Please key in details for your will',
                    style: TextStyle(
                        fontFamily: 'NATS',
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                  )
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.8,
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(height: 10,),
              Form(
                key:_key,
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                            children:[
                              Expanded(
                                child: TextFormField(
                                  validator: validateNotEmpty,
                                  controller: _testerController,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Tester Name',
                                      labelStyle: TextStyle(
                                          fontFamily: 'NATS',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black38)
                                  ),
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ]
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                            children:[
                              Expanded(
                                child: TextFormField(
                                  controller: _executorsandtrusteeController,
                                  validator: validateNotEmpty,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Executors and Trustees',
                                      labelStyle: TextStyle(
                                          fontFamily: 'NATS',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black38)
                                  ),
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ]
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                            children:[
                              Expanded(
                                child: DropdownButton<String>(
                                  value: selectedOption,
                                  items: options.map((option)
                                  => DropdownMenuItem<String> (
                                    value: option,
                                    child: Text(
                                        option,
                                        style: TextStyle(
                                            fontSize:20.0,
                                            fontFamily:'NATS',
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black38)
                                    ),
                                  )).toList(),
                                  onChanged: (option) {
                                    setState(() => selectedOption=option);
                                    _assetsPassedController.text=option!;
                                  },
                                ),
                              ),
                            ]
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                            children:[
                              Expanded(
                                child: TextFormField(
                                  controller: _executor1Controller,
                                  validator: validateNotEmpty,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Executor 1',
                                      labelStyle: TextStyle(
                                          fontFamily: 'NATS',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black38)
                                  ),
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ]
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                            children:[
                              Expanded(
                                child: TextFormField(
                                  controller: _substituteexecutorController,
                                  validator: validateNotEmpty,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Substitute Executors',
                                      labelStyle: TextStyle(
                                          fontFamily: 'NATS',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black38)
                                  ),
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ]
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                            children:[
                              Expanded(
                                child: TextFormField(
                                  controller: _specificgiftsController,
                                  validator: validateNotEmpty,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Specific Gifts',
                                      labelStyle: TextStyle(
                                          fontFamily: 'NATS',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black38)
                                  ),
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ]
                        )
                    ),
                  ],
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
                            if (_key.currentState!.validate()) {
                              _showMyDialog();
                            }
                          }
                      )
                  )
              ),

            ]
        ),
      ),

    );
  }


  //3. to save into firestore plan
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
                saveWillPlan(uid: uid, docID: widget.ID);

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
              child: const Text('Return'),
              onPressed: ()  {
                count=0;
                Navigator.popUntil(context, (route) {
                  return count++ == 3;
                });
              },
            ),
          ],
        );
      },
    );
  }
}

String? validateNotEmpty(String? field) {
  if (field==null || field.isEmpty) {
    return "Field required";
  }
  return null;
}