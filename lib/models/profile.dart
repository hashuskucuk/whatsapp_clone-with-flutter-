import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  late String id;

  late String userName;
  late String image;

  Profile({ required this.id,required this.image, required this.userName});
  factory Profile.fromSnapshot(DocumentSnapshot snapshot){
    return Profile (
      id:snapshot.id,//documentId olmalıydı sen sadce id yazıdn 
      userName: snapshot["userName"],
      image: snapshot["image"],
    );
  }
}
