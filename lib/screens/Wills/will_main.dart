import 'package:flutter/material.dart';
import 'package:next_stage/models/willform.dart';
import 'package:next_stage/screens/Wills/willFilling.dart';

class WillMain extends StatefulWidget {
  static const String routeName = '/willFill';

  const WillMain({Key? key}) : super(key: key);

  @override
  _WillMainState createState() => _WillMainState();
}


class _WillMainState extends State<WillMain> {
  final trip=new Trip("","","","","","","");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Formalities of a Will'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[300],
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Image(
              image: AssetImage('assets/images/Formalities of a will.PNG'),
            ),
            SizedBox(height: 20.0),
            Container(
              width: MediaQuery.of(context).size.width - 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => WillForm(trip: trip)));
                },
                child: Text(
                  'Next',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}