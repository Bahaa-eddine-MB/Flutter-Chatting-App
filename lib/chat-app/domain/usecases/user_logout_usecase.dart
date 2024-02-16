import 'package:dartz/dartz.dart';
import 'package:chat_app/chat-app/domain/repository/base_user_repository.dart';
import 'package:chat_app/core/error/failure.dart';

class UserLogOut {
  final BaseUserRepository repository;

  UserLogOut(this.repository);

  Future<Either<Failure, void>> execute() async {
    return await repository.logout();
  }
}
