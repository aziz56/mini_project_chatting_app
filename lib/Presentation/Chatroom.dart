import 'package:flutter/material.dart';
import 'package:flutter_application_2/Domain/entities/entities.dart';
import 'package:flutter_application_2/Domain/usecase/usecase.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatroomPage extends StatefulWidget{
  late String username;
  ChatroomPage(this.username);

  @override
  State<StatefulWidget> createState() => _ChatroomPageState(username);

}

class _ChatroomPageState extends State<ChatroomPage>{
  late Future<List<String>> chatRoom;

  _ChatroomPageState(String username);


  @override
  void initState() {
    chatRoom = GetChatroom().execute(widget.username).then(
            (chatRoomsData) {
          return chatRoomsData.rooms;
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatroom'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: FutureBuilder<Chatroom>(
          future: GetChatroom().execute(widget.username),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError || !snapshot.hasData){
              return Center(child: Text('Error loading chatroom'));
            } else{
              final user = snapshot.data!;
              return ListView.builder(
                itemCount: user.rooms.length,
                itemBuilder: (context, index) {
                  final roomId = user.rooms[index];
                  print('INI DEBUGGING 3 ${roomId}');
                  return FutureBuilder<ChatuserList>(
                    future: GetChatlist().execute(roomId),
                    builder: (context, snapshot) {
                      print('INI DEBUGGING 2 ${snapshot}');
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return ListTile(
                          title: Text(roomId),
                          subtitle: Text('Loading...'),
                          onTap: () {
                            // Handle onTap as needed
                          },
                        );
                      } else if (snapshot.hasError) {
                        print('Error loading chat room data for room $roomId: ${snapshot.error}');
                        return ListTile(
                          title: Text(roomId),
                          subtitle: Text('Error loading chat room data'),
                          onTap: () {
                            // Handle onTap as needed
                          },
                        );
                      } else if (!snapshot.hasData) {
                        print('No data available for chat room $roomId');
                        return ListTile(
                          title: Text(roomId),
                          subtitle: Text('No data available for chat room'),
                          onTap: () {
                            // Handle onTap as needed
                          },
                        );
                      } else {
                        final chatUserlist = snapshot.data!;
                        final receiverUser = chatUserlist.usernames.where((username) => username != widget.username).toList();
                        final senderUser = widget.username;
                        final receiverSlicedUser = receiverUser.map((username) => username).join(', ');
                        final chatMessage = chatUserlist.messages;

                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Text(
                                    receiverSlicedUser.isNotEmpty ? receiverSlicedUser[0].toUpperCase() : '?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,)
                                )
                            ),
                            title: Text('${receiverSlicedUser}', style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text('${chatMessage[0].text}'),
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => ChatPage('${receiverSlicedUser}', roomId, senderUser))
                              );
                            },
                          ),
                        );
                      }
                    },
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NewChatPage())
          );
        } ,
        child: Icon(Icons.add_comment_outlined),
      ),
    );
  }


}
