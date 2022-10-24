import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class UpdateObituary extends StatefulWidget {
  final String ID;
  const UpdateObituary({Key? key, required this.ID}) : super(key: key,);

  static const String routeName = '/update-obituary';

  @override
  State<UpdateObituary> createState() => _UpdateObituaryState();
}

class _UpdateObituaryState extends State<UpdateObituary> {

  int count=0;

  @override
  // 1. Setting up database with Firestore database functions
  final db = FirebaseFirestore.instance;

  Future<String>saveObituaryPlan({required String uid, required String docID}) async {

    final docUser = db.collection("userData").doc(uid).collection(
        'Obituary').doc(docID);
    print(docUser);
    docUser.update({
      'date_of_death': _dateoofdeathController.text,
      'deceased_name': _nameController.text,
      'funeral_date': _funeraldatecontroller.text,
      'funeral_time': _funeraltimecontroller.text,
      'location_of_wake': _locationofwakeController.text,
      'names_of_family': _familycontroller.text,
      'newspaper': _newscontroller.text,
      'phone': _phonecontroller.text,
    });
    return docUser.id;
  }

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _dateoofdeathController = new TextEditingController();
  TextEditingController _locationofwakeController = new TextEditingController();
  TextEditingController _funeraldatecontroller = new TextEditingController();
  TextEditingController _funeraltimecontroller = new TextEditingController();
  TextEditingController _familycontroller = new TextEditingController();
  TextEditingController _newscontroller = new TextEditingController();
  TextEditingController _phonecontroller = new TextEditingController();


  // This is to set up the data which was routed from the last page
  List<NewspaperData> _newspaper = NewspaperData.getNewspaper();
  late List<DropdownMenuItem<NewspaperData>> _dropdownMenuItems;
  late NewspaperData? _selectedCompany;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_newspaper);
    _selectedCompany = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Obituary"),
        backgroundColor: Colors.orangeAccent,),
        body: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(10,20,10,0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      //constraints: 10,
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Select Newspaper Provider",
                      //fillColor: Colors.brown[50]
                    ),
                    value: _selectedCompany,
                    items: _dropdownMenuItems,
                    onTap: () async {
                      setState(() => _selectedCompany = _selectedCompany);
                      _phonecontroller.text = _selectedCompany?.phone as String; //set output date to TextField value.
                      _newscontroller.text = _selectedCompany?.name as String;
                    },
                    onChanged: onChangeDropdownItem,
                  ),

                ),
                Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.fromLTRB(20,20,10,0),
                    child: const Text(
                      'Please key in Particulars of Deceased below',
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
                SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      children:[
                        Expanded(
                          child: TextField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Name of Deceased',
                                labelStyle: TextStyle(
                                    fontFamily: 'NATS',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black38)
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(width: 16,),
                        Expanded(
                          child: TextField(
                            controller: _dateoofdeathController,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.calendar_today_outlined),
                                labelText: "Date of Death",
                                labelStyle: TextStyle(
                                    fontFamily: 'NATS',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black38)
                            ),
                            onTap: () async {
                              DateTime? pickedDate1 = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime.now()
                              );
                              if(pickedDate1 != null){
                                setState(() {
                                  // date = formattedDate;
                                  _dateoofdeathController.text = DateFormat('yyyy-MM-dd').format(pickedDate1); //set output date to TextField value.
                                });
                              }else{
                                return;
                              }
                            },
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ]
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _locationofwakeController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Location of Wake',
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
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      children:[
                        Expanded(
                          child: TextField(
                            controller: _funeraldatecontroller,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.calendar_today_outlined),
                                labelText: "Funeral Date",
                                labelStyle: TextStyle(
                                    fontFamily: 'NATS',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black38)
                            ),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2030)
                              );
                              if(pickedDate != null){
                                setState(() {
                                  // date = formattedDate;
                                  _funeraldatecontroller.text = DateFormat('yyyy-MM-dd').format(pickedDate); //set output date to TextField value.
                                });
                              }else{
                                return;
                              }
                            },
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(width: 16,),
                        Expanded(
                          child: TextField(
                            controller: _funeraltimecontroller,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.timer_outlined),
                                labelText: "Funeral Time",
                                labelStyle: TextStyle(
                                    fontFamily: 'NATS',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black38)
                            ),
                            onTap: () async {
                              TimeOfDay? pickedTime =  await showTimePicker(
                                initialTime: TimeOfDay.now(),
                                context: context,
                              );

                              if(pickedTime != null ){
                                print(pickedTime.format(context));   //output 10:51 PM
                                DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());

                                setState(() {
                                  _funeraltimecontroller.text = DateFormat('HH:mm:ss').format(parsedTime);; //set the value of text field.
                                });
                              }else{
                                print("Time is not selected");
                              }
                            },
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ]
                  ),
                ),


                Container(
                  padding: const EdgeInsets.fromLTRB(10,10,10,10),
                  child: TextField(
                    controller: _familycontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Names of Family Members',
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
                SizedBox(height: 0,),
                Center(
                    child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width - 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Color(0xFFF17532)
                        ),
                        child: ElevatedButton(
                            child: Text('Add to plans',
                              style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                            onPressed: () async {
                              _showMyDialog();
                            }
                        )
                    )
                ),
                SizedBox(height: 10,),
              ],
            )
        )
    );
  }


  //3. to save into firestore plan
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
                saveObituaryPlan(uid: uid, docID: widget.ID);
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
              child: const Text('Return'),
              onPressed: ()  {
                count=0;
                Navigator.popUntil(context, (route) {
                  return count++ == 3;
                });
              },
            ),
          ],
        );
      },
    );
  }

  onChangeDropdownItem(NewspaperData? selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany!;
      _newscontroller = _selectedCompany as TextEditingController;
    });
  }

  List<DropdownMenuItem<NewspaperData>> buildDropdownMenuItems(List newspaper) {
    List<DropdownMenuItem<NewspaperData>> items = [];

    for (NewspaperData name in newspaper) {
      items.add(
        DropdownMenuItem(
          value: name,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8,0,8,0),
            child: Row(
              children: [
                Image.asset(
                  name.images,
                  width: 22,
                  height: 22,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(name.name)
              ],
            ),
          ),
        ),
      );
    }
    return items;
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class NewspaperData {
  int id;
  String name;
  String images;
  String phone;

  NewspaperData(this.id, this.name, this.images, this.phone);

  static List<NewspaperData> getNewspaper() {
    return <NewspaperData>[
      NewspaperData(
          1, 'The Straits Times', 'assets/images/straitstimes.png', '1800-289-9988'),
      NewspaperData(
          2, 'The Sunday Times', 'assets/images/sundaytimes.png', '1800-289-9988'),
      NewspaperData(
          3, 'Today', 'assets/images/today.png', '1800-252-7723'),
      NewspaperData(
          4, 'Lianhe Zaobao', 'assets/images/lianhezaobao.png', '1800-289-9988'),
      NewspaperData(
          5, 'Lianhe Wanbao', 'assets/images/lianhewanbao.png', '1800-289-9988'),
      NewspaperData(
          6, 'Shin Min Daily News', 'assets/images/shinmingdailynews.png', '1800-289-9988'),
      NewspaperData(
          7, 'Berita Harian', 'assets/images/beritaharian.png', '1800-289-9988'),
      NewspaperData(
          8, 'Berita Minggu', 'assets/images/beritaharian.png', '1800-289-9988'),
      NewspaperData(
          9, 'Tamil Murasu', 'assets/images/tamilmurasu.png', '63198844'),
    ];
  }

}