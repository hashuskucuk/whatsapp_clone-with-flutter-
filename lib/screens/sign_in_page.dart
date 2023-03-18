import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/viewmodels/sing_in_model.dart';

class SingInPage extends StatelessWidget {
  const SingInPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController_editingControoler = TextEditingController();

    return ChangeNotifierProvider(
        create: (BuildContext context) => GetIt.instance<SignInModel>(),
        child: Consumer<SignInModel>(
          builder: (context, SignInModel model, child) =>
           Scaffold(
            appBar: AppBar(
              title: Text("Sign In for Whatsapp Clone"),
            ),
            body: Container(
              padding: EdgeInsets.all(8),
              child: model.busy
                  ? CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                          Text("Kullanıcı Adı"),
                          TextField(
                            controller: TextEditingController_editingControoler,
                          ),
                          RaisedButton(
                            child: Text("Sign in"),
                            onPressed: () async =>await model.signIn(
                                TextEditingController_editingControoler.text),
                                
                               // Navigator.of(context).push(Material)
                                
                                
                          )
                        ],
                        ),
            ),
          ),
        ),
        );
  }
}
