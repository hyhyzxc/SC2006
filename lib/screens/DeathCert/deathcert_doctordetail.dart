import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:next_stage/models/deathcert_doctor.dart';
import 'dart:convert';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import '../homePage.dart';

class DoctorDetail extends StatefulWidget {
  const DoctorDetail({ Key? key }) : super(key: key);

  static const String routeName = '/doctor-detail';

  @override
  _DoctorDetailState createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {

  @override
  final db = FirebaseFirestore.instance;

  Future<String>saveDoctorPlan({required DeathCertDoctor deathCertDoctor,required String uid}) async {
    final docUser = db.collection("userData").doc(uid).collection('Death Certificate').doc();
    final json = deathCertDoctor.getJson();
    await docUser.set(json);
    return docUser.id;
  }

  var productName = "";
  DeathCertDoctor? product;

  @override
  void initState(){
    super.initState();
  }

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
  Set<Polygon> _polygons = Set<Polygon>();
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polygonLatLngs = <LatLng>[];

  @override
  void didChangeDependencies() {

    var productString = ModalRoute.of(context)?.settings.arguments as String;
    print('page 2');
    print(productString);

    var productJson = jsonDecode(productString);
    print(productJson);

    setState(() {

      product = DeathCertDoctor.fromJson(productJson);

    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    CameraPosition funeralPosition = CameraPosition(
      target: LatLng(product!.corlat, product!.corlong),
      zoom: 14.4746,
    );

    void _setMarker(LatLng point) {
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId('marker'),
            infoWindow: InfoWindow(title: product!.clinic),
            position: point,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueRed),
          ),
        );
      });
    }
    _setMarker(LatLng(product!.corlat, product!.corlong));

    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: TextStyle(
        fontFamily: 'Varela',
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Colors.white
    ));

    return Scaffold(
      appBar: AppBar(title: Text(product!.name),
        backgroundColor: Colors.indigo[100],),
      body: ListView(
          padding: EdgeInsets.all(10.0),
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.indigo[100],
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
                        image: AssetImage('assets/images/clinic.jpg'),
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
                    color: Colors.indigo[50]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    Center(
                      child: Text(product!.name,
                          style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo[500])),
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Text(product!.clinic,
                          style: TextStyle(
                              color: Color(0xFF575E67),
                              fontFamily: 'Varela',
                              fontSize: 16)),
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Text(product!.address,
                          textAlign: TextAlign.center,
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
                        child: Text(product!.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 16.0,
                                color: Colors.grey
                              //color: Color(0xFFB4B8B9)
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                )
            ),
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
            SizedBox(height: 10.0),
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
                            color: Colors.indigo[100]
                        ),
                        child: Center(
                            child: Text('Call ' + product!.phone,
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
                      _callNumber(product!.phone);
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
                    height: 50,
                    child: ElevatedButton(
                      child: Text("Add to Plans"),
                      onPressed: () async {
                        _showMyDialog();
                      },
                    )
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
                      style: style,
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
                            }

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
                DeathCertDoctor deathCertDoctor = DeathCertDoctor(
                    //user_id : uid,
                    id : product!.id,
                    name : product!.name,
                    clinic: product!.clinic,
                    address : product!.address,
                    description : product!.description,
                    phone : product!.phone,
                    rating: product!.rating,
                    corlong : product!.corlong,
                    corlat: product!.corlat
                );

                String docID = await saveDoctorPlan(
                    deathCertDoctor: deathCertDoctor, uid:uid);

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

_callNumber(String phoneNumber) async {
  String number = phoneNumber;
  await FlutterPhoneDirectCaller.callNumber(number);
<<<<<<< Updated upstream
}
=======
}
>>>>>>> Stashed changes
