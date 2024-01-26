
class ChatMessage{
  String username;
  String text;
  var timestamp;

  ChatMessage({required this.username, required this.text, required this.timestamp});

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      username: json['username'],
      text: json['text'],
      timestamp: json['timestamp'],
    );
  }

}

class Chatroom{
  String username;
  List<String> rooms;

  Chatroom({required this.username, required this.rooms});

  factory Chatroom.fromJson(Map<String, dynamic> json) {
    return Chatroom(
      username: json['username'] ?? '', // Replace '' with a default value if needed
      rooms: List<String>.from(json['rooms'] ?? []),
    );
  }
}
class ChatSendMessage{
  String id;
  String senderUsername;
  String text;

  ChatSendMessage({required this.id, required this.senderUsername, required this.text});

  factory ChatSendMessage.fromJson(Map<String, dynamic> json) {
    return ChatSendMessage(
      id: json['id'],
      senderUsername: json['username'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id' : this.id,
      'username' : this.senderUsername,
      'text' : this.text,
    };
  }

}
class ChatuserList {
  // String id;
  List<String> usernames; // List of usernames
  List<ChatMessage> messages;

  ChatuserList({required this.usernames, required this.messages});

  factory ChatuserList.fromJson(Map<String, dynamic> json) {
    print('ini users: ${json}');

    var users = <String>[];
    for(var i = 0; i < json['users'].length; i++){
      users.add(json['users'][i]);
      print('User $i: ${json['users'][i]}');
    }

    var messages = <ChatMessage>[];
    for(var j = 0; j < json['messages'].length; j++){
      messages.add(ChatMessage.fromJson(json['messages'][j]));
      print('Message $j: ${json['messages'][j]}');
    }


    print('Raw message: $messages');
    return ChatuserList(
      usernames: users,
      messages: messages,
    );
  }}
  class CreateChatRoom{
  String username;
  String receiverUsername;

  CreateChatRoom({required this.username, required this.receiverUsername});

  factory CreateChatRoom.fromJson(Map<String, dynamic> json) {
    return CreateChatRoom(
      username: json['from'],
      receiverUsername: json['to'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'from' : this.username,
      'to' : this.receiverUsername,
    };
  }

  static void execute(CreateChatRoom createChat) {}

}