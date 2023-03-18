import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/screens/converstaion_page.dart';
import 'package:whatsapp_clone/viewmodels/chats_model.dart';
import 'package:whatsapp_clone/models/conversation.dart';
import  'package:firebase_core/firebase_core.dart';

class ChatsPage extends StatelessWidget {
  final String userId = "9pHTkhUP3WOkMPDX0q7XMbfC3tc2";
  const ChatsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //FirebaseFirestore.instance
    // .collection('chats');
    // .snapshots() silindi
    //.listen((data) => data.docs.forEach((doc) => print(doc['name'])));
    //silindi
    // burada "docs" kısmı documents olmalıydı şuanda deneme
    // bu kor burada bambaşka sonuçlar verebilir
    
    var model = GetIt.instance<ChatsModel>();
    
    return ChangeNotifierProvider (
      create :(BuildContext context)=> model ,
      child: StreamBuilder<List<Conversation>> (
        stream: model.conversations(userId),

        builder: (BuildContext context, AsyncSnapshot<List<Conversation>> snapshot) {
          if (snapshot.hasError) {
            return Text('Error   ${snapshot.error} ');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Yükleniyor...");
          }
    
          return ListView(
            children: snapshot.data!
                .map((doc) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(doc.profileImage),
                      ),
                      title: Text(doc.name),
                      //title: Text(doc["name"]),
                      subtitle: Text(doc.displayMessage),
    
                      trailing: Column(
                        children: [
                          Text("19.30"),
                          Container(
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.only(top: 8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 252, 40, 139),
                              ),
                              child: Center(
                                child: Text(
                                  "16",
                                  textScaleFactor: 01,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ))
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (content) => ConverstaionPage(
                                      userId: userId,
                                      conversationId: doc.id,
                                      //doc.id olan kısım doc.documentID olmalıydı..
                                      
                                    )));
                      },
                    ))
                .toList(),
            //Data! kısmını biz güncelledik
          );
        },
      ),
    );
  }
}
