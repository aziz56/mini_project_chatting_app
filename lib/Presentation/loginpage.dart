
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Domain/entities/entities.dart';
import 'package:flutter_application_2/Domain/usecase/usecase.dart';
import 'package:flutter_application_2/Presentation/Chatroom.dart';
import 'package:flutter_application_2/main.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
  TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Masukkan username anda disini'
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    try{
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ChatroomPage(_usernameController.text))
                      );
                    }catch(e){
                      print(e);
                    }
                  });
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }

}