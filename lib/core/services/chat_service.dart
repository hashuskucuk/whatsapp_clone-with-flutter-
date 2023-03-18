


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_clone/models/conversation.dart';
import 'package:whatsapp_clone/models/profile.dart';

class ChatService {
final FirebaseFirestore _firestore= FirebaseFirestore.instance;
Stream <List<Conversation>>getConversations(String userId){
var ref=_firestore
.collection('conversations')
.where('members',arrayContains: userId);
return ref.snapshots().map((list)=>
list.docs.map((snapshot)=>Conversation.fromSnapshot(snapshot))
.toList());


}
Future<List<Profile>> getContacs () async {
  var  ref= _firestore.collection("profile");
   var documents = await ref.doc();
   return documents.documents
   .map((snapshat)=> Profile.fromSnapshot(snapshat))
   .toList();

}
}