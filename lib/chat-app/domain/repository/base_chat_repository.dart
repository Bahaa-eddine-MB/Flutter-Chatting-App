import 'package:chat_app/chat-app/data/models/MessageModel.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';

abstract class BaseChatRepository {
  Future<Either<Failure, void>> sendMessage(
      MessageModel message, String chatId);
  Future<Either<Failure, String>> createChat(
      String firstEmail, String secondEmail);
}
