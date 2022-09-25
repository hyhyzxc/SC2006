import 'package:flutter/material.dart';
import 'package:testing/presentation/create_an_account_screen.dart';
import 'package:testing/presentation/main_menu_screen.dart';
import 'package:testing/presentation/sign_in_screen.dart';



void main()=>runApp(MaterialApp( routes: {
  /*WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
  runApp(MyApp());*/

  '/':(context) => SigninWidget(),
  '/mainmenu':(context)=>MainmenuWidget(),
  '/createaccount':(context)=>CreateanaccountWidget(),
},
));
