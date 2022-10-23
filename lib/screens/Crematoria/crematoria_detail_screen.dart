import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    Completer<GoogleMapController> _controller = Completer();
    Set<Marker> _markers = Set<Marker>();
    Set<Polygon> _polygons = Set<Polygon>();
    Set<Polyline> _polylines = Set<Polyline>();
    List<LatLng> polygonLatLngs = <LatLng>[];

    CameraPosition funeralPosition = CameraPosition(
      target: LatLng(facility!.corlat, facility!.corlong),
      zoom: 14.4746,
    );

    void _setMarker(LatLng point) {
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId('marker'),
            infoWindow: InfoWindow(title: facility!.name),
            position: point,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueRed),
          ),
        );
      });
    }
    _setMarker(LatLng(facility!.corlat, facility!.corlong));

    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: TextStyle(
        fontFamily: 'Varela',
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Colors.white
    ));

    return Scaffold(
      appBar: AppBar(title: Text(facility!.name),
        backgroundColor: Colors.orange[200],),
      body: ListView(
          padding: EdgeInsets.all(10.0),
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.orange[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                  bottom: Radius.circular(0),),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/images/funeral_parlour.jpeg'),
                        fit: BoxFit.cover
                    )
                ),
              ),

            ),

            Container(
                width: double.infinity,
                padding: EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(0),
                      bottom: Radius.circular(20),
                    ),
                    color: Colors.orange[50]
                ),
                child: Column(
                    children: [
                    SizedBox(height: 10.0),
            Center(
            child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width - 50.0,
              child: Text(facility!.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[500])),
            )),
            SizedBox(height: 10.0),
            Center(
              child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 50.0,
              child: Text(facility!.address,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 16)),
            )),
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
                        color: Colors.grey)
                ),
              ),
            ),SizedBox(height: 10.0),],)),
            SizedBox(height: 30.0),
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
                            color: Colors.orange[200]
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
            SizedBox(height: 10.0),
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
                      child: const Text('Book an Appointment'),
                      onPressed: () {
                        Navigator.of(context).pushNamed(AddAppointmentCrematoria.routeName, arguments: jsonEncode(facility));}
                  ),
                )
            ),
            SizedBox(height: 10.0),

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
                            return GoogleMap(
                              mapType: MapType.normal,
                              markers: _markers,
                              initialCameraPosition: funeralPosition,
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
                            );
                          },
                        );
                      }
                  ),
                )
            ),
            SizedBox(height: 10.0),

          ]
      ),


    );
  }
}


  _callNumber(String phoneNumber) async {
    String number = phoneNumber;
    await FlutterPhoneDirectCaller.callNumber(number);
  }


