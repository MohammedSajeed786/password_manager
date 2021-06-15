//import 'package:firebase/firebase.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/controller/google_auth.dart';
import 'package:password_manager/home.dart';
//import 'package:flutter/services.dart';
import 'package:password_manager/login.dart';
import 'package:password_manager/wrapper.dart';
import 'package:provider/provider.dart';
//main->wrapper(decides whether to show login page or home)
//login :-login interface
//home:-lists all network names
//view:-to show password of a network and delete
//addnew:- to add data
//google auth:_o authenticate user
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),

      home: Wrapper()
       
     // LoginPage(),
    );
  }
}





