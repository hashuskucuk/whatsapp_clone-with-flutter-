//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:whatsapp_clone/core/services/chat_service.dart';
import 'package:whatsapp_clone/models/conversation.dart';
import 'package:whatsapp_clone/viewmodels/base_model.dart';

class ChatsModel extends BaseModel {
final ChatService _db= GetIt.instance<ChatService>();


Stream<List<Conversation>> conversations(String userId){
return _db.getConversations(userId);
}

}