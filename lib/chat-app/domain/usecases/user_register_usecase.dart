import 'package:chat_app/chat-app/data/models/UserModel.dart';
import 'package:dartz/dartz.dart';
import 'package:chat_app/chat-app/domain/repository/base_user_repository.dart';
import 'package:chat_app/core/error/failure.dart';

class UserRegister {
  final BaseUserRepository repository;

  UserRegister(this.repository);

  Future<Either<Failure, UserModel>> execute(
      String firstName, String lastName, String phone, String password,String email) async {
    return await repository.registerNewUser(firstName, lastName, phone, password,email);
  }
}
