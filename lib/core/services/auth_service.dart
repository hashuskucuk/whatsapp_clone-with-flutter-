import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
 // Future <User> get currentUser => _auth.currentUser();
    User ? get currentUser => _auth.currentUser;

  
 
  Future<User?> signInAnonymously() async {
     {
      var user = await _auth.signInAnonymously();

      return user.user;
    }

  }

  signIn() {}}