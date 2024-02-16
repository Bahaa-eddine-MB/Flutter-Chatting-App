import 'package:dartz/dartz.dart';
import 'package:chat_app/chat-app/domain/repository/base_user_repository.dart';
import 'package:chat_app/core/error/failure.dart';

class UserSendEmail {
  final BaseUserRepository repository;

  UserSendEmail(this.repository);

  Future<Either<Failure, void>> execute() async {
    return await repository.verifyEmail();
  }
}