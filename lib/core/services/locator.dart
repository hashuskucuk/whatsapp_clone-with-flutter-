import 'package:get_it/get_it.dart';
import 'package:whatsapp_clone/core/services/chat_service.dart';
import 'package:whatsapp_clone/viewmodels/chats_model.dart';
import 'package:whatsapp_clone/core/services/auth_service.dart';
import 'package:whatsapp_clone/viewmodels/contacts_model.dart';
import 'package:whatsapp_clone/viewmodels/main_model.dart';
  import 'package:whatsapp_clone/viewmodels/sing_in_model.dart';
import 'package:whatsapp_clone/core/services/navigator_service.dart';
import 'navigator_service.dart';
 
GetIt getIt= GetIt.instance;




setupLocators(){
getIt.registerLazySingleton(() => ChatService());
getIt.registerLazySingleton(() => NavigatorService());
getIt.registerLazySingleton(() => AuthService());

getIt.registerFactory(() => ChatsModel());
getIt.registerFactory(() => MainModel());
getIt.registerFactory(() => ContactsModel());

getIt.registerFactory(() => SignInModel());
//SignInModel());


}