import 'package:flutter_application_2/Domain/entities/entities.dart';
import 'package:flutter_application_2/data/repository/repository.dart';

class CreateChatroom{
  var repository = CreateChatroomRepo();

  Future<String> execute(CreateChatRoom createChatRoom){
    return repository.createChatroom(createChatRoom);
  }

}