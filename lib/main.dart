import 'package:flutter/material.dart';
import 'package:next_stage/screens/DeathCert/deathcert_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:next_stage/screens/DeathCert/deathcert_doctordetail.dart';
import 'package:next_stage/screens/DeathCert/deathcert_searchdoctor.dart';
import 'package:next_stage/screens/DeathCert/deathcert_hospital.dart';
import 'package:next_stage/screens/DeathCert/deathcert_viewcert.dart';
import 'package:next_stage/screens/Obituary/obituary_main.dart';
import 'package:next_stage/screens/Funeral/product_detail_screen.dart';
import 'package:next_stage/screens/Funeral/product_list_screen.dart';
import 'package:next_stage/screens/Obituary/obituary_form.dart';
import 'package:next_stage/models/obituaryform.dart';
import 'package:next_stage/screens/Plans/plans_main.dart';
import 'package:next_stage/screens/Wills/will_main.dart';

import 'models/obituary.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final newTrip = new Trip("","","","","","","");
    final newObituary = new Obituary();
    final newNewspaper = new NewspaperData(0,"","","");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const WillFill(),
      routes: {
        ProductListScreen.routeName: (context) => ProductListScreen(),
        ViewPlans.routeName: (context) => ViewPlans(),
        WillFill.routeName: (context) => WillFill(),
        ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
        SearchDoctor.routeName: (context) => SearchDoctor(),
        DoctorDetail.routeName: (context) => DoctorDetail(),
        DeathCertMain.routeName: (context) => DeathCertMain(),
        DeathAtHospital.routeName: (context) => DeathAtHospital(),
        ObituaryMainNew.routeName: (context) => ObituaryMainNew(),
        ObituaryForm.routeName: (context) =>
            ObituaryForm(trip: newTrip, newspaper: newNewspaper,),
        ViewCert.routeName: (context) => ViewCert(title: "view",),
      }
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Doggie'),
        ),
        body: const DeathCertMain());
  }
}

