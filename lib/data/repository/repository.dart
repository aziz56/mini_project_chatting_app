import 'dart:async';

import 'package:flutter_application_2/data/datasource/remote_source.dart';

class UserRepository {
  final RemoteDatasource _dataSource;

  UserRepository(this._dataSource);

  Future<Map<String, dynamic>> getUserByUsername(String username) {
    
    return _dataSource.getUserByUsername(username);

  }

  Future<Map<String, dynamic>> getChatRoomById(String id) {
    return _dataSource.getChatRoomById(id);
  }

  Future<Map<String, dynamic>> getRoomsByUsername(String username) {
    return _dataSource.getRoomsByUsername(username);
  }

  Future<Map<String, dynamic>> createChatRoom(String from, String to) {
    return _dataSource.createChatRoom(from, to);
  }

  Future<bool> addChatMessage(String id, String username, String text) {
    return _dataSource.addChatMessage(id, username, text);
  }
}
