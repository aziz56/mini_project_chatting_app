import 'package:flutter_application_2/Domain/entities/entities.dart';
import 'package:flutter_application_2/data/repository/repository.dart';

class GetChatroom{
  var repository = ChatRepository();

  Future<Chatroom> execute(String username) async {
    return repository.getChatrooms(username);
  }

}