import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:next_stage/main.dart';
import 'package:next_stage/models/obituaryform.dart';
import 'package:next_stage/screens/homePage.dart';
import 'package:next_stage/screens/Obituary/obituary_form_confirm.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';

class ObituaryForm extends StatefulWidget {
  final obiTrip trip;

  final NewspaperData newspaper;
  ObituaryForm({Key? key, required this.trip, required this.newspaper}) : super(key: key);

  static const String routeName = '/obituary-form';

  @override
  State<ObituaryForm> createState() => _ObituaryFormState();
}

class _ObituaryFormState extends State<ObituaryForm> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _dateoofdeathController = new TextEditingController();
  TextEditingController _locationofwakeController = new TextEditingController();
  TextEditingController _funeraldatecontroller = new TextEditingController();
  TextEditingController _funeraltimecontroller = new TextEditingController();
  TextEditingController _familycontroller = new TextEditingController();
  TextEditingController _newscontroller = new TextEditingController();

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
        appBar: AppBar(
          title: Text('Particulars'),
        ),
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
                        fillColor: Colors.blueGrey[50]
                    ),
                    value: _selectedCompany,
                    items: _dropdownMenuItems,
                    onTap: () async {
                      if(_selectedCompany != null){
                        setState(() {
                          _selectedCompany = _selectedCompany;
                          _newscontroller.text = _selectedCompany as String; //set output date to TextField value.
                        });
                      }else{
                        return;
                      }},
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
                  padding: const EdgeInsets.all(10),
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
                Container(
                  height: 70,
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: ElevatedButton(
                    //icon: Icon(Icons.upload),
                    child: Text('UPLOAD FILE'),
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform.pickFiles();
                      if (result == null) return;  // if user don't pick any thing then do nothing just return.
                      PlatformFile file = result!.files.first;
                      print('File Name: ${file?.name}');
                      print('File Size: ${file?.size}');
                      print('File Extension: ${file?.extension}');
                      print('File Path: ${file?.path}');
                      // var picked = await FilePicker.platform.pickFiles();
                      //
                      // if (picked != null) {
                      //   print(picked.files.first.name);
                      //}
                    },
                  ),
                ),

                Container(
                  height: 70,
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: ElevatedButton(
                    child: Text("PROCEED"),
                    onPressed: () {
                      widget.trip.name = _nameController.text;
                      widget.trip.dateofdeath = _dateoofdeathController.text;
                      widget.trip.locationofwake = _locationofwakeController.text;
                      widget.trip.funeraldate = _funeraldatecontroller.text;
                      widget.trip.funeraltime = _funeraltimecontroller.text;
                      widget.trip.familynames = _familycontroller.text;
                      widget.trip.newspaper = _newscontroller.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ObituaryConfirm(trip: widget.trip, newspaper: widget.newspaper)),
                      );
                    },
                  ),),
                SizedBox(height: 10,),
              ],
            )
        )
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

class NewspaperData {
  int id;
  String name;
  String images;
  String phone;

  NewspaperData(this.id, this.name, this.images, this.phone);

  static List<NewspaperData> getNewspaper() {
    return <NewspaperData>[
      NewspaperData(
          1, 'The Straits Times', 'assets/images/straitstimes.png', '62263333'),
      NewspaperData(
          2, 'The Sunday Times', 'assets/images/sundaytimes.png', '62263333'),
      NewspaperData(3, 'Today', 'assets/images/today.png', '61111111'),
      NewspaperData(
          4, 'Lianhe Zaobao', 'assets/images/lianhezaobao.png', '62263333'),
      NewspaperData(
          5, 'Lianhe Wanbao', 'assets/images/lianhewanbao.png', '62263333'),
      NewspaperData(
          6, 'Shin Min Daily News', 'assets/images/shinmingdailynews.png',
          '62263333'),
      NewspaperData(
          7, 'Berita Harian', 'assets/images/beritaharian.png', '62263333'),
      NewspaperData(
          8, 'Berita Minggu', 'assets/images/beritaharian.png', '62263333'),
      NewspaperData(
          9, 'Tamil Murasu', 'assets/images/tamilmurasu.png', '60000000'),
    ];
  }

}