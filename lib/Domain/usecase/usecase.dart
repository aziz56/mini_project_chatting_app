import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Domain/entities/entities.dart';
import 'package:flutter_application_2/data/datasource/remote_source.dart';
import 'package:flutter_application_2/data/repository/repository.dart';

// class ChatUseCase {
//   final UserRepository userRepository;
//   final RemoteDatasource chatDataSource;
 
 

//   ChatUseCase({required this.userRepository, required this.chatDataSource});

//   Future<Map<String, dynamic>> getUserData(String username) {
//     return userRepository.getUserByUsername(username);
//   }

//   Future<Map<String, dynamic>> getChatRoomData(String roomId) {
//     return chatDataSource.getChatRoomById(roomId);
//   }

//   Future<Map<String, dynamic>> getUserRooms(String username) {
//     return userRepository.getRoomsByUsername(username);
//   }

//   Future<Map<String, dynamic>> createChatRoom(String from, String to) {
//     return userRepository.createChatRoom(from, to);
//   }

//   Future<bool> addChatMessage(String roomId, String username, String text) {
//     return chatDataSource.addChatMessage(roomId, username, text);
//   }
// }

// class GetRoomsByUser{
//   var repository = UserRepository();
//   Future<Map<String, dynamic>> execute(String username){
//     return repository.getRoomsByUsername(username);
// }
// }
// class GetUserByUsername{
//     var repository = UserRepository();
//   Future<Map<String, dynamic>> execute(String username){
//     return repository.getUserByUsername(username);
// }
// }
// class GetChatRoomByID{
//   var repository = UserRepository();
//   Future<Map<String, dynamic>> execute(String username){
//     return repository.getChatRoomById(username);
// }
// }
// class AddChat{
//   var repository = UserRepository();
//   Future<bool> execute(String id, String username, String text){
//     return repository.addChatMessage(id, username, text);
//   }
// }

class GetChatlist{
  var repository = ChatUserlistRepository();

  Future<ChatuserList> execute(String id){
    return repository.getChatuserList(id);
  }

}
class GetChatroom{
  var repository = ChatRepository();

  Future<Chatroom> execute(String username) async {
    return repository.getChatrooms(username);
  }

}
class PostChat{
  var repository = PostChatRepository();

  Future<bool> execute(ChatSendMessage chatSendMessage){
    return repository.postChat(chatSendMessage);
  }
}

