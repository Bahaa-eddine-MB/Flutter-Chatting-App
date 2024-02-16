import 'package:chat_app/chat-app/data/models/UserModel.dart';
import 'package:chat_app/chat-app/domain/repository/base_user_repository.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class GetUserByID {
  final BaseUserRepository repository;

  GetUserByID(this.repository);

  Future<Either<Failure, UserModel>> execute(String userId) async {
    return await repository.getUserById(userId);
  }
}
