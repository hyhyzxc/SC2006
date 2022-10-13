import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:next_stage/models/user.dart';
import 'package:next_stage/screens/DeathCert/deathcert_doctordetail.dart';
import 'package:next_stage/screens/DeathCert/deathcert_main.dart';
import 'package:next_stage/screens/loginPage.dart';

import '../models/obituary.dart';
import '../models/obituaryform.dart';
import 'Funeral/product_detail_screen.dart';
import 'Funeral/product_list_screen.dart';
import 'Obituary/obituary_form.dart';
import 'Plans/plans_main.dart';
import 'Wills/will_main.dart';

class NavBar extends StatelessWidget {
  final newTrip = new obiTrip("","","","","","","","");
  final newObituary = new Obituary();
  final newNewspaper = new NewspaperData(0,"","","");
  final FirebaseAuth auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  Future<Users?> getUser() async {
    final User? user = auth.currentUser;
    final String uid = user!.uid;
    final planData = FirebaseFirestore.instance.collection('User').doc(uid);
    final snapshot = await planData.get();

    if(snapshot.exists) {
      return Users.fromJson(snapshot.data()!);
    }
  }

  @override
  Widget build(BuildContext context) {

    final User? user = auth.currentUser;
    final String uid = user!.uid;
    final userData = db.collection("User").doc(uid);

    return Drawer(
      child: FutureBuilder<Users?>(
        future: getUser(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("Welcome ${snapshot.data!.username}!"),
                  accountEmail: Text(snapshot.data!.email),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child: Image.network(
                        'https://pin.it/AXw7EvZ',
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text('Death Certificate'),
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => DeathCertMain())),
                ),
                ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Obituary'),
                    onTap: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => ObituaryForm(trip: newTrip, newspaper: newNewspaper)))),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Funeral'),
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ProductListScreen())),
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text('Crematoria'),
                  // onTap: () => Navigator.push(
                  //   context, MaterialPageRoute(builder: (context) => null ())),
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text('Doctors Detail'),
                  /*    onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => DoctorDetail())),*/
                ),
                Divider(),
                ListTile(
                  title: Text('Exit'),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => loginPage())),
                ),
              ],
            );
          } else {
            return Center(
              child : CircularProgressIndicator(),
            );
          }
        }
      )
    );
  }
}