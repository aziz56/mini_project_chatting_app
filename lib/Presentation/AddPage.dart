import 'package:flutter/material.dart';



import 'package:flutter/material.dart';
import 'package:mini_project_chatapp/domain/entities/createChat.dart';

class AddChatPage extends StatefulWidget {
  late String sender;

  AddChatPage(String sender);
  // AddChatPage({required this.sender});

  @override
  State<StatefulWidget>createState() => _AddChatPageState();
}

class _AddChatPageState extends State<AddChatPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _receiverUsernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Chat'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter username';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _receiverUsernameController,
              decoration: InputDecoration(
                labelText: 'Receiver Username',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter receiver username';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final username = _usernameController.text;
                  final receiverUsername = _receiverUsernameController.text;
                  final createChat = CreateChatRoom(username: username, receiverUsername: receiverUsername);
                  CreateChatRoom.execute(createChat);
                  Navigator.pop(context);
                }
              },
              child: Text('Add Chat'),
            ),
          ],
        ),
      ),
    );
  }
}