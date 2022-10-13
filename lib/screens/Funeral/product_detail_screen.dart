import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:next_stage/models/funeralparlor.dart';
import 'dart:convert';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../googleMap.dart';
import '../homePage.dart';


class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({ Key? key }) : super(key: key);

  static const String routeName = '/product-detail';

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
  Set<Polygon> _polygons = Set<Polygon>();
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polygonLatLngs = <LatLng>[];
  var productName = "";
  FuneralParlor? product;

  @override
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies() {

    var productString = ModalRoute.of(context)?.settings.arguments as String;
    print('page 2');
    print(productString);

    var productJson = jsonDecode(productString);
    print(productJson);

    setState(() {

      product = FuneralParlor.fromJson(productJson);

    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
                  Text('Plan saved successfully'),
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

    CameraPosition funeralPosition = CameraPosition(
      target: LatLng(product!.corlat, product!.corlong),
      zoom: 14.4746,
    );

    void _setMarker(LatLng point) {
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId('marker'),
            infoWindow: InfoWindow(title: product!.name),
            position: point,
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
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
      appBar: AppBar(title: Text(product!.name),),
      body: ListView(
          children: [
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),

            ),
            SizedBox(height: 10.0),
            Center(
                child: Image.asset('assets/images/funeral_parlour.jpeg',
                    height: 300.0,
                    width: 500.0,
                    fit: BoxFit.contain
                )
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(product!.name,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(product!.address,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 16)),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text(product!.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16.0,
                        color: Color(0xFFB4B8B9))
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
                child: InkWell(

                    child:Container(
                        width: MediaQuery.of(context).size.width - 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Color(0xFFF17532)
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
            SizedBox(height: 20.0),
            Center(
                child: Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xFFF17532)
                    ),
                    child: Center(
                        child: ElevatedButton(
                          child: Text("Add to Plans"),
                          onPressed: () async {
                            final FirebaseAuth auth = FirebaseAuth.instance;
                            final User? user = auth.currentUser;
                            final String uid = user!.uid;
                            final db = FirebaseFirestore.instance;

                            Map<String, dynamic>json = product!.toJson();
                            final setFuneralPlan = db.collection('Funeral').doc();
                            await setFuneralPlan.set(json);

                            String newFuneralPlanID = setFuneralPlan.id;

                            final updateMainPlan = db.collection('Plan').doc(
                                uid);
                            final snapshotPlan = await updateMainPlan.get();
                            if (snapshotPlan.exists) {
                              updateMainPlan.update({
                                'funeralPlanID': newFuneralPlanID,
                              });
                            } else {
                              print("Error: cannot find Plan");
                            }
                            _showMyDialog();
                          },
                        )
                    )
                )
            ),
            SizedBox(height: 20.0),

            Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 50.0,
                  height: 50.0,
                  child: ElevatedButton(
                      style:style,
                      child: const Text('show in Maps'),
                      onPressed: () {showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return GoogleMap(
                            mapType: MapType.normal,
                              markers: _markers,
                              initialCameraPosition: funeralPosition,
                          onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                          },
                      );}
                  );},
                )
            ),
          )
        ],
      ),
    );
  }
}



_callNumber(String phoneNumber) async {
  String number = phoneNumber;
  await FlutterPhoneDirectCaller.callNumber(number);
}