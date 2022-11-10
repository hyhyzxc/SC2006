import 'package:next_stage/models/afterlifefacilities.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:next_stage/models/crematoriumappointment.dart';
import 'package:next_stage/screens/homePage.dart';

class AddAppointmentCrematoria extends StatefulWidget {
  const AddAppointmentCrematoria({Key? key}) : super(key: key);
  static const String routeName = '/addappointment-crematoria';

  @override
  State<AddAppointmentCrematoria> createState() => _AddAppointmentCrematoriaState();
}

class _AddAppointmentCrematoriaState extends State<AddAppointmentCrematoria> {
  @override
  // 1. Setting up database with Firestore database functions
  final db = FirebaseFirestore.instance;

  Future<String>saveCrematoriaAppointmentPlan({required CrematoriumAppointment crematoriumAppointment,required String uid}) async {
    final docUser = db.collection("userData").doc(uid).collection('Crematoria').doc();
    final json = crematoriumAppointment.getJson();
    await docUser.set(json);
    return docUser.id;
  }

  final GlobalKey<FormState> _key=GlobalKey<FormState>();

  List<String> packageSelector=['Taoist Package','Buddhist Package','Christian Package','Muslim Package','Hindu Package'];
  String? packageChoose ='Taoist Package';

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _appttimecontroller = new TextEditingController();
  TextEditingController _apptdatecontroller = new TextEditingController();


  // This is to set up the data which was routed from the last page
  var placeName = "";

  AfterLifeFacilities? place;

  @override
  void initState(){
    super.initState();

  }

  @override
  void didChangeDependencies() {

    var placeString = ModalRoute.of(context)?.settings.arguments as String;
    print('page 3');
    print(placeString);

    var placeJson = jsonDecode(placeString);
    print(placeJson);

    setState(() {

      place = AfterLifeFacilities.fromJson(placeJson);

    });

    super.didChangeDependencies();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking"),
        backgroundColor: Colors.orange[200],),
      body:Center(
        child:ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(20,20,10,0),
                  child: const Text(
                    'Please key in Particulars of Deceased below',
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
                      key: _key,
                      child: Column(
                        children: [
                          Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                          children:[
                          Expanded(
                          child: TextFormField(
                          validator: validateNotEmpty,
                          controller: _nameController,
                          decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name of Deceased',
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
                                      controller: _apptdatecontroller,
                                      keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          prefixIcon: Icon(Icons.calendar_today_outlined),
                                          labelText: "Funeral Date",
                                          labelStyle: TextStyle(
                                              fontFamily: 'NATS',
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black38)
                                      ),
                                      onTap: () async {
                                        DateTime? pickedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now().add(Duration(days: 5)),
                                            firstDate: DateTime.now(),//DateTime.now() - not to allow to choose before today.
                                            lastDate: DateTime.now().add(Duration(days: 40))
                                        );
                                        if(pickedDate != null){
                                          setState(() {
                                            // date = formattedDate;
                                            _apptdatecontroller.text = DateFormat('yyyy-MM-dd').format(pickedDate); //set output date to TextField value.
                                          });
                                        }
                                      },
                                      validator: (value) {
                                        if (_apptdatecontroller.text=='') {
                                          return "Funeral Date required";
                                        }
                                        return null;
                                      },
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                  SizedBox(width: 16,),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _appttimecontroller,
                                      keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          prefixIcon: Icon(Icons.timer_outlined),
                                          labelText: "Funeral Time",
                                          labelStyle: TextStyle(
                                              fontFamily: 'NATS',
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black38)
                                      ),
                                      onTap: () async {
                                        TimeOfDay? pickedTime =  await showTimePicker(
                                          initialTime: TimeOfDay.now(),
                                          context: context,
                                        );

                                        if(pickedTime != null ){
                                          print(pickedTime.format(context));   //output 10:51 PM
                                          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());

                                          setState(() {
                                            _appttimecontroller.text = DateFormat('HH:mm:ss').format(parsedTime);; //set the value of text field.
                                          });
                                        }
                                      },
                                      validator: (value) {
                                        if (_appttimecontroller.text=='') {
                                          return "Funeral Time required";
                                        }
                                        return null;
                                      },
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            padding:const EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all( const Radius.circular(5.0)),
                                ),contentPadding: EdgeInsets.fromLTRB(20,20,20,20),
                                filled:true,
                                hintStyle:TextStyle(color:Colors.grey[800]),
                                hintText: "Select Crematorium Package",

                              ),
                              value:packageChoose,
                              items:packageSelector
                                  .map((packageSelector) => DropdownMenuItem<String>(
                                  value: packageSelector,
                                  child: Text(packageSelector,style: TextStyle(
                                      fontFamily: 'NATS',
                                      fontWeight: FontWeight.normal,
                                      color:Colors.black,
                                      fontSize: 18),)
                              ))
                                  .toList(),
                              onChanged: (packageSelector)=>setState(() =>packageChoose=packageSelector),
                              validator: (value) {
                                if (packageChoose==null) {
                                  return "Crematorium Package required";
                                }
                                return null;
                              },
                            ),
                          ),
                  ],
                ),
              ),
              SizedBox(height: 250.0),
              Center(
                  child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: ElevatedButton(
                          child: Text('Add to Plans',
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
                  CrematoriumAppointment crematoriumAppointment = CrematoriumAppointment(
                      user_id: uid,
                      name: place!.name,
                      address: place!.address,
                      description: place!.description,
                      appt_date: _apptdatecontroller!.text,
                      appt_time: _appttimecontroller!.text,
                      package: packageChoose!);

                  String docID = await saveCrematoriaAppointmentPlan(
                      crematoriumAppointment: crematoriumAppointment, uid: uid);

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

