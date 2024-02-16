import 'package:dartz/dartz.dart';
import 'package:chat_app/chat-app/domain/repository/base_user_repository.dart';
import 'package:chat_app/core/error/failure.dart';

class UserSendForgotPassword {
  final BaseUserRepository repository;

  UserSendForgotPassword(this.repository);

  Future<Either<Failure, void>> execute(String email) async {
    return await repository.sendForgotEmail(email);
  }
}