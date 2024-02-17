import 'package:equatable/equatable.dart';

class ChatEntity extends Equatable {
  final String chatId;
  final List<String> users;
  final DateTime createdAt;

  const ChatEntity({
    required this.chatId,
    required this.users,
    required this.createdAt,
  });

  @override
  List<Object> get props => [users, createdAt,chatId];
}