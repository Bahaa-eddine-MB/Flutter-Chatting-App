import 'package:chat_app/chat-app/data/models/MessageModel.dart';
import 'package:chat_app/chat-app/domain/repository/base_chat_repository.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class SendMessage {
  final BaseChatRepository repository;

  SendMessage(this.repository);

  Future<Either<Failure, void>> execute(MessageModel message, String chatId) async {
    return await repository.sendMessage(message,chatId);
  }
}
