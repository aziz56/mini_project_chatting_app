import 'package:flutter_application_2/Domain/entities/entities.dart';
import 'package:flutter_application_2/data/repository/repository.dart';

class PostChat{
  var repository = PostChatRepository();

  Future<bool> execute(ChatSendMessage chatSendMessage){
    return repository.postChat(chatSendMessage);
  }
}