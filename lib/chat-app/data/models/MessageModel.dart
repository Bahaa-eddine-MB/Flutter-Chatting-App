import 'package:chat_app/chat-app/domain/entities/MessageEnity.dart';

class MessageModel extends MessageEntity {
  const MessageModel({
    required super.sender,
    required super.message,
    required super.date,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'],
      date: DateTime.parse(json['date']),
      sender: json['sender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'message': message,
      'date': date.toIso8601String(),
    };
  }
}
