import 'package:flutter/material.dart';
import 'package:stc_portal/dialog_for_password.dart';
import 'package:stc_portal/enter_details.dart';
import 'package:stc_portal/home.dart';
import 'package:stc_portal/myroutes.dart';
import 'package:stc_portal/pers_info.dart';
import 'package:stc_portal/result.dart';
import 'package:stc_portal/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:stc_portal/splash.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const splash(),
      //initialRoute: myroutes.home,
      routes: {
        myroutes.splash: (context) => const splash(),
        myroutes.login: (context) => login(),
        myroutes.signup: (context) => signup(),
        myroutes.home: (context) => const home(),
        myroutes.result: (context) => const result(),
        myroutes.pers_info :(context) => const pers_info(),
        myroutes.enter_details :(context) => const enter_details(),
        myroutes.dialog_for_password:(context) => const dialog_for_password()
      },
    );
  }
}
