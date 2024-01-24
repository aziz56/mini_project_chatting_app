import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
 
void main() {
  runApp(const ChatApp());
}
 
class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
 
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
 
  @override
  LoginPageState createState() => LoginPageState();
}
 
class LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomePage(username: usernameController.text)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
 
class HomePage extends StatefulWidget {
  final String username;
 
  const HomePage({Key? key, required this.username}) : super(key: key);
 
  @override
  HomePageState createState() => HomePageState();
}
 
class HomePageState extends State<HomePage> {

 
  @override
  void initState() {
    super.initState();
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          String roomId = rooms[index];
          var lastMessage =
              roomMessages[roomId] != null && roomMessages[roomId]!.isNotEmpty
                  ? roomMessages[roomId]!.last
                  : null;
          return ListTile(
            leading: CircleAvatar(
              child: Text(lastMessage != null
                  ? lastMessage['username'][0].toUpperCase()
                  : ''),
            ),
            title: Text(lastMessage != null
                ? '${lastMessage['username']} : ${lastMessage['text']}'
                : 'No messages'),
             subtitle: Text(lastMessage != null
                ? 'Timestamp: ${lastMessage['timestamp']}'
                : ''),
            onTap: () {
              // Navigate to the chatroom page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatRoomPage(
                      roomId: roomId,
                      username: widget.username,
                    ),
                  ));
            },
          );
        },
      ),
    );
  }}

 
class ChatRoomPage extends StatefulWidget {
  final String roomId;
  final String username;
 
  const ChatRoomPage({Key? key, required this.roomId, required this.username})
      : super(key: key);
 
  @override
  ChatRoomPageState createState() => ChatRoomPageState();
}
 
class ChatRoomPageState extends State<ChatRoomPage> {
  List<Map<String, dynamic>> messages = [];
  final messageController = TextEditingController();
 
  @override
  void initState() {
    super.initState();
    _getMessages();
  }
 
  _getMessages() async {
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8080/api/chat/${widget.roomId}'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['data'] != null) {
        setState(() {
          messages = List<Map<String, dynamic>>.from(data['data']['messages']);
        });
      } else {
        // handle the case when 'data' is null
        messages = [];
      }
    } else {
      throw Exception('Failed to load messages for room ${widget.roomId}');
    }
  }
 
  _sendMessage() async {
    // Implement your message sending logic here
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room ${widget.roomId}'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var message = messages[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(message['username'][0].toUpperCase()),
                  ),
                  title: Text('${message['username']} : ${message['text']}'),
                  subtitle: Text('Timestamp: ${message['timestamp']}'),
                );
              },
            ),
          ),
          TextField(
            controller: messageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Message',
            ),
          ),
          ElevatedButton(
            child: const Text('Send'),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}
 