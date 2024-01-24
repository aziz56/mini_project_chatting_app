import 'dart:async';

import 'package:flutter_application_2/data/datasource/remote_source.dart';
import 'package:flutter_application_2/data/repository/repository.dart';

class ChatUseCase {
  final UserRepository userRepository;
  final RemoteDatasource chatDataSource;
  

  ChatUseCase({required this.userRepository, required this.chatDataSource});

  Future<Map<String, dynamic>> getUserData(String username) {
    return userRepository.getUserByUsername(username);
  }

  Future<Map<String, dynamic>> getChatRoomData(String roomId) {
    return chatDataSource.getChatRoomById(roomId);
  }

  Future<Map<String, dynamic>> getUserRooms(String username) {
    return userRepository.getRoomsByUsername(username);
  }

  Future<Map<String, dynamic>> createChatRoom(String from, String to) {
    return userRepository.createChatRoom(from, to);
  }

  Future<bool> addChatMessage(String roomId, String username, String text) {
    return chatDataSource.addChatMessage(roomId, username, text);
  }
}
