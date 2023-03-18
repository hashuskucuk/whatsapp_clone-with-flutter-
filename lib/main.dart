import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/core/services/locator.dart';
import 'package:whatsapp_clone/screens/sign_in_page.dart';
import 'package:whatsapp_clone/core/services/navigator_service.dart';
import 'package:whatsapp_clone/viewmodels/sing_in_model.dart';

//import 'package:whatsapp_clone/locator.dart';



import 'package:whatsapp_clone/whatsapp_main.dart';
import  'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

void main() 
async 
 {
WidgetsFlutterBinding.ensureInitialized();//silebilirsin belki
//Firebase.initializeApp();//*** */
  setupLocators();
//WidgetsFlutterBinding.ensureInitialized();
// üst satır gereksiz olabilir 
//6 async ve 10 ve 11. satır sonradan eklendi...
//WidgetsFlutterBinding.ensureInitialized();
  await 
 Firebase.initializeApp();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Color.fromARGB(255, 216, 214, 214),
      ),
      home: WhatsAppMain(),
    );
  }
}
