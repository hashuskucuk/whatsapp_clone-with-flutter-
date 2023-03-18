import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/services/auth_service.dart';
import 'package:whatsapp_clone/core/services/locator.dart';
import 'package:whatsapp_clone/core/services/navigator_service.dart';
import 'package:whatsapp_clone/viewmodels/base_model.dart';
import 'package:whatsapp_clone/whatsapp_main.dart';







import 'package:whatsapp_clone/core/services/auth_service.dart';





class SignInModel extends BaseModel {
  final AuthService _authService = getIt<AuthService>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser =>  _authService.currentUser;

  
   late var userName;

 // get _authService => null;// bu satırı silmen gerekecek/gerekeblir....
  
  
  
  Future<void> signIn(text) async {
    if (userName.isEmpty) return;
    busy = true;
    try {
      var user = await _authService.signIn();
      await _firestore.collection('profile').doc(user.uid).set({
        // set data olması laaızımdı
        'userName': userName,
        'image': "https://placekitten.com200/200"
      });
      await navigatorService.navigateToRaplace(WhatsAppMain());
    } catch (e) {
      busy = false;
    }

    busy = false;
  }
}
