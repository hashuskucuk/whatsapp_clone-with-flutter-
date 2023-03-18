import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Conversation {
  late String id;
  late String name;
  late String profileImage;
  late String displayMessage;

  Conversation(
      {required this.id,
      required this.name,
      required this.profileImage,
      required this.displayMessage});

    factory Conversation.fromSnapshot(DocumentSnapshot snapshot){
      
      var documentID;
      
      return Conversation(
       
       //id:  snapshot.documentID,
       id: snapshot.id,//DocumentId olmalıydı id depil
         name: "Dali",
         profileImage: "https://placekitten.com/200/200",
         displayMessage: snapshot["displayMessage"],
         //displayMessage: snapshot.data()["displayMessage"],
         //olmalıydı
      );
    }

}
