import 'package:chat_app/chat-app/data/models/ChatModel.dart';
import 'package:chat_app/chat-app/domain/repository/base_chat_repository.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class GetMyChats {
  final BaseChatRepository repository;

  GetMyChats(this.repository);

  Future<Either<Failure, List<ChatModel>>> execute(String email) async {
    return await repository.getMyChats(email);
  }
}
