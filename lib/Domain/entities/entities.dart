class User {
  final String username;
  final List<String> rooms;

  User({required this.username, required this.rooms});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      rooms: List<String>.from(json['rooms']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'rooms': rooms,
    };
  }
}

class Message {
  final String username;
  final String text;
  final int timestamp;

  Message({required this.username, required this.text, required this.timestamp});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      username: json['username'],
      text: json['text'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'text': text,
      'timestamp': timestamp,
    };
  }
}

class ChatRoom {
  final String id;
  final List<String> users;
  final List<Message> messages;

  ChatRoom({required this.id, required this.users, required this.messages});

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    return ChatRoom(
      id: json['id'],
      users: List<String>.from(json['users']),
      messages: List<Message>.from(json['messages'].map((message) => Message.fromJson(message))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'users': users,
      'messages': messages.map((message) => message.toJson()).toList(),
    };
  }
}
