import 'package:flutter/material.dart';
import 'package:next_stage/screens/Wills/will_confirm.dart';
import 'package:next_stage/screens/Wills/will_main.dart';
import 'package:next_stage/models/willform.dart';

class WillForm extends StatefulWidget {
  final Trip trip;

  WillForm({Key? key, required this.trip}) : super(key: key);

  static const String routeName = '/willFilling';

  @override
  State<WillForm> createState() => _WillFormState();
}

class _WillFormState extends State<WillForm> {
  TextEditingController _testerController = new TextEditingController();
  TextEditingController _executorsandtrusteeController = new TextEditingController();
  TextEditingController _executor1Controller = new TextEditingController();
  TextEditingController _substituteexecutorController = new TextEditingController();
  TextEditingController _specificgiftsController = new TextEditingController();

  List<String> options=['Singapore Assets Only','Worldwide Assets Only'];
  String? selectedOption='Singapore Assets Only';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Make Will'),
        ),
        body: Center(
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      'Please key in details for your will',
                      style: TextStyle(
                          fontFamily: 'NATS',
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    )),
                Divider(
                  color: Colors.grey,
                  thickness: 0.8,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                    controller: _testerController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tester Particulars',
                        labelStyle: TextStyle(
                            fontFamily: 'NATS',
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black38)
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                    controller: _executorsandtrusteeController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Executors and Trustees',
                        labelStyle: TextStyle(
                            fontFamily: 'NATS',
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black38)
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: DropdownButton<String>(
                    value: selectedOption,
                    items: options.map((option)
                    => DropdownMenuItem<String> (
                      value: option,
                      child: Text(
                          option,
                          style: TextStyle(
                              fontSize:20.0,
                              fontFamily:'NATS',
                              fontWeight: FontWeight.normal,
                              color: Colors.black38)
                      ),
                    )).toList(),
                    onChanged: (option) => setState(() => selectedOption=option),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                    controller: _executor1Controller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Executor 1',
                        labelStyle: TextStyle(
                            fontFamily: 'NATS',
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black38)
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                    controller: _substituteexecutorController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Substitute Executors',
                        labelStyle: TextStyle(
                            fontFamily: 'NATS',
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black38)
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                      children:[
                        SizedBox(width: 16,),
                      ]
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                    controller: _specificgiftsController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Specific gifts',
                      labelStyle: TextStyle(
                          fontFamily: 'NATS',
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black38),
                      contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),

                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      widget.trip.tester = _testerController.text;
                      widget.trip.executorAndTrustee = _executorsandtrusteeController.text;
                      widget.trip.executor1 = _executor1Controller.text;
                      widget.trip.substituteExecutor = _substituteexecutorController.text;
                      widget.trip.gifts = _specificgiftsController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WillConfirm(trip: widget.trip),
                      ));
                    },
                    child: Text(
                      'Proceed',
                      style: TextStyle(
                          fontFamily: 'NATS',
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black38)
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                        'Save to Plans',
                        style: TextStyle(
                            fontFamily: 'NATS',
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black38)
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                    ),
                    child: Text(
                        'Delete',
                        style: TextStyle(
                            fontFamily: 'NATS',
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black38)
                    ),
                  ),
                ),
              ],
            )
        )
    );
  }
// uploadImage() async {
// _getDateFromUser() async {
//   DateTime? _pickerDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime(2022),
//       firstDate: DateTime(2022),
//       lastDate: DateTime(2022)
//   );
// }
}

class LawyerData {
  String name;
  String contactNumber;
  String emailAddress;

  LawyerData(this.name,this.contactNumber,this.emailAddress);

  static List<LawyerData> getWill() {
    return <LawyerData>[
      LawyerData(
          'Tom', '94573123', 'hugmedaddy@gmail.com'),
      LawyerData(
          'Dick', '93245133', 'airpodspro@gmail.com'),
      LawyerData(
          'Jin', '92330041', 'airpodspro2@gmail.com'),
    ];
  }
}