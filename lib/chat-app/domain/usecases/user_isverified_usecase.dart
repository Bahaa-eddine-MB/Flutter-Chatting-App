import 'package:chat_app/chat-app/domain/repository/base_user_repository.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class UserVerified {
  final BaseUserRepository repository;

  UserVerified(this.repository);

  Future<Either<Failure, bool>> execute() async {
    return await repository.isUserVerified();
  }
}
