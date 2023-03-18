


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/services/locator.dart';
import 'package:whatsapp_clone/models/profile.dart';
import 'package:whatsapp_clone/viewmodels/contacts_model.dart';

class ContactsPage extends StatelessWidget {
const ContactsPage ({Key? key}) :super (key: key);
@override 

  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("kişiler"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
               onPressed: () {
                showSearch(context: context, delegate: ContactsSearchDelegate());
               },
          ),
                IconButton(
            icon: Icon(Icons.more_vert),
               onPressed: () {},
             ),
        ],
      ),

    body : ContactList(query: '',),
    //(query: '',) bu kısım olmamalıydı





    );
  }
}

class ContactList extends StatelessWidget {
 final String query;
  const ContactList({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var model = getIt<ContactsModel>();


    return FutureBuilder(
      builder: (BuildContext context , AsyncSnapshot <List<Profile>>snapshot){
        if( snapshot.hasError) return Center( 
          child:  Text(snapshot.hasError.toString()),
        );
        if(!snapshot.hasData) return Center(
          child:  CircularProgressIndicator(),

        );
         return ListView (
        children: [
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.group),
             ),
            title: Text("yeni grup"),
          ),
          ListTile(
             leading: CircleAvatar(child: Icon(Icons.person_add),),
            title: Text("yeni kişi"),)
        ],
      );}
    );
  }
}
      class ContactsSearchDelegate extends SearchDelegate {


        @override
        ThemeData appBarTheme (BuildContext context){
          final theme =Theme.of(context);
          return theme.copyWith(
        primaryColor: Colors.deepOrange,
          );
          return super.appBarTheme(context);
        }
        @override
        List<Widget> buildActions(BuildContext context) {
          return [];
        }
      
        @override
        Widget? buildLeading(BuildContext context) {
          return IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed:() {
              close(context, null);
            },
          );
        }
      
        @override
        Widget buildResults(BuildContext context) {
          return Container();
        }
      
        @override
        Widget buildSuggestions(BuildContext context) {
          return  Center(
            child: Text("sohbet aramaya başlayın"),
          );
        }

      }
