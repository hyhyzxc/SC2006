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

  @override
  final db = FirebaseFirestore.instance;

  Future<String>saveFuneralPlan({required FuneralParlor funeralParlor,required String uid}) async {
    final docUser = db.collection("userData").doc(uid).collection('Funeral').doc();
    final json = funeralParlor.getJson();
    await docUser.set(json);
    return docUser.id;
  }

  var productName = "";
  FuneralParlor? product;

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

      product = FuneralParlor.fromJson(productJson);

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
      appBar: AppBar(title: Text(product!.name),
      backgroundColor: Colors.blue[200],),
      body: ListView(
          children: [
            Center(
                child: Image.asset('assets/images/funeral_parlour.jpeg',
                    height: 300.0,
                    width: 500.0,
                    fit: BoxFit.fitHeight
                )
            ),
            SizedBox(height: 30.0),
            Center(
            child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
              child: Text(product!.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[200])),
            )),
            SizedBox(height: 10.0),
            Center(
            child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
              child: Text(product!.address,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 16)),
            )),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text(product!.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16.0,
                        color: Colors.grey)
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
                            color: Colors.blue[200],
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
                    width: MediaQuery.of(context).size.width - 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                    ),
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
                  width: MediaQuery.of(context).size.width - 50.0,
                  height: 50.0,
                  child: ElevatedButton(
                      style:style,
                      child: const Text('Show in Maps'),
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
          ),
            SizedBox(height: 10.0),
        ],
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
                FuneralParlor funeralParlor = FuneralParlor(
                    id : product!.id,
                    name : product!.name,
                    address : product!.address,
                    description : product!.description,
                    phone : product!.phone,
                    rating: product!.rating,
                    corlong : product!.corlong,
                    corlat: product!.corlat
                );

                String docID = await saveFuneralPlan(
                    funeralParlor: funeralParlor, uid:uid);

                /*final planData = FirebaseFirestore.instance.collection(
                    'Plan').doc(uid);
                final snapshot = await planData.get();

                print(docID);
                if (snapshot.exists) {
                  planData.update({
                    'crematoriumApptID': docID!,
                  });
                } else {
                  print("Error: cannot find Plan");
                }*/
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
}