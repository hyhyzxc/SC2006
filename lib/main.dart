import 'package:flutter/material.dart';
import 'package:next_stage/screens/Crematoria/crematoria_add_appointment.dart';
import 'package:next_stage/screens/Crematoria/crematoria_detail_screen.dart';
import 'package:next_stage/screens/Crematoria/crematoria_list_screen.dart';
import 'package:next_stage/screens/DeathCert/deathcert_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:next_stage/screens/DeathCert/deathcert_doctordetail.dart';
import 'package:next_stage/screens/DeathCert/deathcert_searchdoctor.dart';
import 'package:next_stage/screens/DeathCert/deathcert_hospital.dart';
import 'package:next_stage/screens/DeathCert/deathcert_viewcert.dart';
import 'package:next_stage/screens/Obituary/obituary_main.dart';
import 'package:next_stage/screens/Funeral/funeral_details.dart';
import 'package:next_stage/screens/Funeral/funeral_list.dart';
import 'package:next_stage/screens/Obituary/obituary_form.dart';
import 'package:next_stage/models/obituaryform.dart';
import 'package:next_stage/screens/Plans/plans_main.dart';
import 'package:next_stage/screens/Plans/crematorium_plans.dart';
import 'package:next_stage/screens/Wills/lawyers_details.dart';
import 'package:next_stage/screens/Wills/lawyers_search.dart';
import 'package:next_stage/screens/Wills/willFilling.dart';
import 'package:next_stage/screens/Wills/will_confirm.dart';
import 'package:next_stage/screens/Wills/will_main.dart';
import 'package:next_stage/screens/loginPage.dart';
import 'package:next_stage/models/willform.dart';

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
    final ObituaryTrip = new obiTrip("","","","","","","","");
    final WillTrip = new Trip("","","","","","","");
    final newNewspaper = new NewspaperData(0,"","","");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: loginPage(),
      routes: {
        ProductListScreen.routeName: (context) => ProductListScreen(),
        ViewPlans.routeName: (context) => ViewPlans(),
        WillMain.routeName: (context) => WillMain(),
        WillForm.routeName: (context) => WillForm(trip: WillTrip),
        WillConfirm.routeName: (context) => WillConfirm(trip: WillTrip),
        SearchLawyer.routeName: (context) => SearchLawyer(),
        LawyerDetail.routeName: (context) => LawyerDetail(),
        ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
        SearchDoctor.routeName: (context) => SearchDoctor(),
        DoctorDetail.routeName: (context) => DoctorDetail(),
        DeathCertMain.routeName: (context) => DeathCertMain(),
        DeathAtHospital.routeName: (context) => DeathAtHospital(),
        ObituaryMainNew.routeName: (context) => ObituaryMainNew(),
        ObituaryForm.routeName: (context) =>
            ObituaryForm(trip: ObituaryTrip, newspaper: newNewspaper,),
        ViewCert.routeName: (context) => ViewCert(title: "view",),
        Crematoria.routeName:(context)=>Crematoria(),
        CrematoriaDetails.routeName:(context)=>CrematoriaDetails(),
        AddAppointmentCrematoria.routeName:(context)=>AddAppointmentCrematoria(),
        PlansCrematoria.routeName:(context)=>PlansCrematoria(),
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
        body: const loginPage());
  }
}

