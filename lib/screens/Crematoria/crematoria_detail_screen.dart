import 'package:next_stage/models/afterlifefacilities.dart' show AfterLifeFacilities;
import 'dart:convert';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter/material.dart';
import 'package:next_stage/screens/Crematoria/crematoria_add_appointment.dart';
import 'package:next_stage/screens/Crematoria/crematoria_list_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:next_stage/models/obituaryform.dart';
import 'package:next_stage/screens/homePage.dart';
import 'package:next_stage/screens/Obituary/obituary_form_confirm.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CrematoriaDetails extends StatefulWidget {
  const CrematoriaDetails({Key? key}) : super(key: key);
  static const String routeName = '/crematoria-detail';
  @override
  State<CrematoriaDetails> createState() => _CrematoriaDetailsState();
}

class _CrematoriaDetailsState extends State<CrematoriaDetails> {
  @override
  TextEditingController _planscontroller = new TextEditingController();



  var facilityName = "";
  AfterLifeFacilities? facility;

  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    var facilityString = ModalRoute
        .of(context)
        ?.settings
        .arguments as String;
    print('page 2');
    print(facilityString);

    var facilityJson = jsonDecode(facilityString);
    print(facilityJson);

    setState(() {
      facility = AfterLifeFacilities.fromJson(facilityJson);
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: TextStyle(
        fontFamily: 'Varela',
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Colors.white
    ));

    return Scaffold(
      appBar: AppBar(title: Text(facility!.name),
        backgroundColor: Colors.orange[300],),
      body: ListView(
          children: [
            Center(
                child: Image.asset('assets/images/funeral_parlour.jpeg',
                    height: 300.0,
                    width: 500.0,
                    fit: BoxFit.fitHeight
                )
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(facility!.name,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[300])),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(facility!.address,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 16)),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 50.0,
                child: Text(facility!.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16.0,
                        color: Color(0xFFB4B8B9))
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Center(
                child: InkWell(

                    child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width - 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.orange[300]
                        ),
                        child: Center(
                            child: Text('Call ' + facility!.phone,
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
                      _callNumber(facility!.phone);
                    }
                )
            ),
            SizedBox(height: 20.0),
            Center(
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 50.0,
                  height: 50.0,
                  child: ElevatedButton(
                      // style: ElevatedButton.styleFrom(
                      //     primary: Colors.orangeAccent),
                      child: const Text('Book an appointment'),
                      onPressed: () {
                        Navigator.of(context).pushNamed(AddAppointmentCrematoria.routeName, arguments: jsonEncode(facility));}
                  ),
                )
            ),
            SizedBox(height: 20.0),

            Center(
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 50.0,
                  height: 50.0,
                  child: ElevatedButton(
                      // style: ElevatedButton.styleFrom(
                      //     primary: Colors.orangeAccent),

                      child: const Text('Show in Maps'),
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 200,
                              color: Colors.amber,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text('Modal BottomSheet'),
                                    ElevatedButton(
                                      // style: ElevatedButton.styleFrom(
                                      //     primary: Colors.orangeAccent),
                                      child: const Text('Close BottomSheet'),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                  ),
                )
            ),
            SizedBox(height: 20.0),

          ]
      ),


    );
  }
}


  _callNumber(String phoneNumber) async {
    String number = phoneNumber;
    await FlutterPhoneDirectCaller.callNumber(number);
  }


