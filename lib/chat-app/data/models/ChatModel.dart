import 'package:chat_app/chat-app/domain/entities/ChatEntity.dart';

class ChatModel extends ChatEntity {
  const ChatModel({
    required super.chatId,
    required super.createdAt,
    required super.users,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      chatId: json['chatId'],
      users: json['users'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chatId': chatId,
      'users': users,
      'createdAt': createdAt,
    };
  }
}
