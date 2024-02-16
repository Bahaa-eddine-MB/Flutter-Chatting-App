import 'package:chat_app/chat-app/data/models/UserModel.dart';
import 'package:dartz/dartz.dart';
import 'package:chat_app/chat-app/domain/repository/base_user_repository.dart';
import 'package:chat_app/core/error/failure.dart';

class UserUpdate {
  final BaseUserRepository repository;

  UserUpdate(this.repository);

  Future<Either<Failure, UserModel>> execute(
      String firstName, String lastName, String phone,String email) async {
    return await repository.updateUser(firstName, lastName, phone,email);
  }
}
