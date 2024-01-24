import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteDatasource{
  static const URL = 'http://127.168.0.0.1:8080';
    Future<Map<String, dynamic>> getUserByUsername(String username) async {
    final response = await http.get(Uri.parse('$URL/api/user/$username'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }
  }
    Future<Map<String, dynamic>> getChatRoomById(String id) async {
    final response = await http.get(Uri.parse('$URL/api/chat/$id'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load chat room data');
    }
  }
  Future<Map<String, dynamic>> getRoomsByUsername(String username) async {
    final response = await http.get(Uri.parse('$URL/api/room/$username'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user rooms data');
    }
  }
  Future<Map<String, dynamic>> createChatRoom(String from, String to) async {
    final response = await http.post(
      Uri.parse('$URL/api/room'),
      body: json.encode({'from': from, 'to': to}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create chat room');
    }
  }
  Future<bool> addChatMessage(String id, String username, String text) async {
    final response = await http.post(
      Uri.parse('$URL/api/chat'),
      body: json.encode({'id': id, 'username': username, 'text': text}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to add chat message');
    }
  }

  }