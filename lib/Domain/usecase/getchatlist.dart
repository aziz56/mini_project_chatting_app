import 'package:flutter_application_2/Domain/entities/entities.dart';
import 'package:flutter_application_2/data/repository/repository.dart';

class GetChatlist{
  var repository = ChatUserlistRepository();

  Future<ChatuserList> execute(String id){
    return repository.getChatuserList(id);
  }

}