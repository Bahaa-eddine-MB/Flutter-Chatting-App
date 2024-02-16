import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String message;
  final String sender;
  final DateTime date;

  const MessageEntity({
    required this.sender,
    required this.message,
    required this.date,
  });

  @override
  List<Object> get props => [message, date,sender];
}