import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:next_stage/models/obituaryform.dart';
import 'package:next_stage/screens/Obituary/obituary_form_confirm.dart';
import 'package:file_picker/file_picker.dart';
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

  final GlobalKey<FormState> _key=GlobalKey<FormState>();

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _dateofdeathController = new TextEditingController();
  TextEditingController _locationofwakeController = new TextEditingController();
  TextEditingController _funeraldatecontroller = new TextEditingController();
  TextEditingController _funeraltimecontroller = new TextEditingController();
  TextEditingController _familycontroller = new TextEditingController();
  TextEditingController _newscontroller = new TextEditingController();
  TextEditingController _phonecontroller = new TextEditingController();

  List<NewspaperData> _newspaper = NewspaperData.getNewspaper();
  late List<DropdownMenuItem<NewspaperData>> _dropdownMenuItems;
  late NewspaperData? _selectedCompany;

  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future uploadFile(PlatformFile? pickedFile) async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download Link: $urlDownload');

    setState(() {
      uploadTask = null;
    });
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if(result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

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
          backgroundColor: Colors.brown[200],
        ),
        body: Center(
            child: ListView(
              children: <Widget>[
                Form(
                  key:_key,
                  child: Column(
                    children: [
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
                          onChanged: onChangeDropdownItem,
                          validator: (value) {
                            if (_selectedCompany==null) {
                              return "Newspaper Provider required";
                            }
                            return null;
                          },
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
                                child: TextFormField(
                                  controller: _nameController,
                                  validator: validateNotEmpty,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Name of Deceased',
                                      labelStyle: TextStyle(
                                          fontFamily: 'NATS',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black38)
                                  ),
                                  onTap:() {
                                    _phonecontroller.text = _selectedCompany?.phone as String; //set output date to TextField value.
                                    _newscontroller.text = _selectedCompany?.name as String;
                                  },
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                              SizedBox(width: 16,),
                              Expanded(
                                child: TextFormField(
                                  controller: _dateofdeathController,
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
                                        _dateofdeathController.text = DateFormat('yyyy-MM-dd').format(pickedDate1); //set output date to TextField value.
                                      });
                                    }
                                  },
                                  validator: (value) {
                                    if (_dateofdeathController.text=='') {
                                      return "Date of Death required";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ]
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: _locationofwakeController,
                          validator: validateNotEmpty,
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
                                child: TextFormField(
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
                                        _funeraldatecontroller.text = DateFormat('yyyy-MM-dd').format(pickedDate); //set output date to TextField value.
                                      });
                                    }
                                  },
                                  validator: (value) {
                                    if (_funeraldatecontroller.text=='') {
                                      return "Funeral Date required";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                              SizedBox(width: 16,),
                              Expanded(
                                child: TextFormField(
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
                                    }
                                  },
                                  validator: (value) {
                                    if (_funeraltimecontroller.text=='') {
                                      return "Funeral Time required";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ]
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10,10,10,10),
                        child: TextFormField(
                          controller: _familycontroller,
                          validator: validateNotEmpty,
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
                    ],
                  ),
                ),
                SizedBox(height: 0,),
                if(pickedFile!=null)
                  Expanded(
                    child: Container(
                        color: Colors.blue[100],
                        child: Center(
                          child: Text(pickedFile!.name),
                        )
                    ),
                  ),
                Container(
                  height: 70,
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: ElevatedButton(
                    //icon: Icon(Icons.upload),
                    child: Text('Upload File'),
                    onPressed: () async {
                      selectFile();
                      uploadFile(pickedFile);
                    },
                  ),
                ),

                Container(
                  height: 70,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: ElevatedButton(
                    child: Text("Proceed"),
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        widget.trip.name = _nameController.text;
                        widget.trip.dateofdeath = _dateofdeathController.text;
                        widget.trip.locationofwake =
                            _locationofwakeController.text;
                        widget.trip.funeraldate = _funeraldatecontroller.text;
                        widget.trip.funeraltime = _funeraltimecontroller.text;
                        widget.trip.familynames = _familycontroller.text;
                        widget.trip.newspaper = _newscontroller.text;
                        widget.trip.phone = _phonecontroller.text;
                        uploadFile(pickedFile);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              ObituaryConfirm(trip: widget.trip,
                                  newspaper: widget.newspaper)),
                        );
                      }
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

String? validateNotEmpty(String? field) {
  if (field==null || field.isEmpty) {
    return "Field required";
  }
  return null;
}



