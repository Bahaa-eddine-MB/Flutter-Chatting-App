import 'package:chat_app/chat-app/domain/repository/base_chat_repository.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class CreateChat {
  final BaseChatRepository repository;

  CreateChat(this.repository);

  Future<Either<Failure, String>> execute(String firstEmail, String secondEmail) async {
    return await repository.createChat(firstEmail,secondEmail);
  }
}
