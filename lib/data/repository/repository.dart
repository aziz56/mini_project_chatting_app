import 'package:flutter_application_2/Domain/entities/entities.dart';
import 'package:flutter_application_2/data/datasource/remote_source.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class ChatRepository {
  var remoteChatDatasource = RemoteChatDatasource();

  Future<Chatroom> getChatrooms(String username) async{
    var jsonArray = jsonDecode(await remoteChatDatasource.getChatrooms(username))['data'];
    Chatroom chatroom = Chatroom.fromJson(jsonArray);
    print(jsonArray.toString());
    return chatroom;
  }
}

class ChatUserlistRepository {
  var remoteChatDatasource = RemoteChatDatasource();

  Future<ChatuserList> getChatuserList(String id) async{
    var jsonArray = jsonDecode(await remoteChatDatasource.getChatlist(id))['data'];
    ChatuserList chatroom = ChatuserList.fromJson(jsonArray);
    return chatroom;
  }

}
class PostChatRepository {
  var remoteChatDataSource = RemoteChatDatasource();

  Future<bool> postChat(ChatSendMessage chatSendMessage) async {
    var response = await remoteChatDataSource.postChat(chatSendMessage.toJson());
    print(response);
    return jsonDecode(response)['data']; // Fix this line
  }
}
class CreateChatroomRepo{
  var remoteChatDataSource = RemoteChatDatasource();
  Future<String> createChatroom(CreateChatRoom createChatRoom) async{
    var response = await remoteChatDataSource.createChatRoom(createChatRoom.toJson());
    return jsonDecode(response)['data'];
  }
}