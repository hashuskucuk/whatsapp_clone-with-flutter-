import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/calls_page.dart';
import 'package:whatsapp_clone/screens/camera_page.dart';
import 'package:whatsapp_clone/screens/chats_page.dart';
import 'package:whatsapp_clone/screens/status_page.dart';
import 'package:whatsapp_clone/viewmodels/main_model.dart';


import 'core/services/locator.dart';

class WhatsAppMain extends StatefulWidget {
  WhatsAppMain({Key? key}) : super(key: key);
  @override
  _WhatsAppMainState createState() => _WhatsAppMainState();
}

class _WhatsAppMainState extends State<WhatsAppMain>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showMessage = true;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4, initialIndex: 1);
    _tabController.addListener(() {
      _showMessage = _tabController.index != 0;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var model = getIt<MainModel>();
    return Scaffold(
      body: Container(
        color:Theme.of(context).primaryColor ,
        child: SafeArea(
          child:NestedScrollView(
          headerSliverBuilder: 
          (BuildContext context, bool innerBoxIsScrolled) {
            return [
              //////////////////
              SliverAppBar(
                floating: true,
               // snap: true, 
                title: Text("Whatsapp clone"),
                actions: <Widget> [
                  IconButton(
                    icon:Icon(Icons.search),
                    onPressed: () {  },),
                      
                  
                    IconButton(
                      icon:Icon(Icons.more_vert),
                      onPressed: () {},
                      )
                  
                ],
              )
            ];
          },
          body: Column(
            children: <Widget >[
            
               TabBar(
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.camera),  ),
                      
                  
                    Tab(text: "Chats" ),
                      
                   
                    Tab(text: "Status"),
                      
                    
                    Tab(text: "Calls"),
                    // textlerden sonraki virgülleri sildim

                      
                    
                  ],
                ),
              // container
              Expanded(
                child: Container( 
                  color:Colors.white,
                  child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    CameraPage(),
                    ChatsPage(),
                    StatusPage(),
                    CallsPage(),

                    // Container(color: Colors.blue),
                    //Container(color: Colors.yellow),
                    // Container(color: Colors.red),
                  ],
                ),
              ),
              ),

            ],
          ),
          ),
        ),
              
          ),
        
    
      
    floatingActionButton:
    _showMessage
        ? FloatingActionButton(
            child: Icon(
              Icons.message,
            color:Colors.blueAccent
            ),
            onPressed: () async {

             //await model.navigateToContacts();
            },
          )
        : null,
    // nul için bir insert ya da ignore işlemi yaptım hatırllamıyorum !!
    );
  }
}
