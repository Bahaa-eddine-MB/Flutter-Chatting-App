import 'package:chat_app/chat-app/data/models/UserModel.dart';
import 'package:chat_app/chat-app/domain/repository/base_user_repository.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class UserGetAll {
  final BaseUserRepository repository;

  UserGetAll(this.repository);

  Future<Either<Failure, List<UserModel>>> execute() async {
    return await repository.getAllUsers();
  }
}
