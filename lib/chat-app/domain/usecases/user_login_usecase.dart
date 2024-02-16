import 'package:chat_app/chat-app/data/models/UserModel.dart';
import 'package:dartz/dartz.dart';
import 'package:chat_app/chat-app/domain/repository/base_user_repository.dart';
import 'package:chat_app/core/error/failure.dart';

class UserLogin {
  final BaseUserRepository repository;

  UserLogin(this.repository);

  Future<Either<Failure, UserModel>> execute(String email, String password) async {
    return await repository.login( email, password);
  }
}
