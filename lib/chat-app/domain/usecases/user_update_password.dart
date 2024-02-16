import 'package:dartz/dartz.dart';
import 'package:chat_app/chat-app/domain/repository/base_user_repository.dart';
import 'package:chat_app/core/error/failure.dart';

class UserPasswordUpdate {
  final BaseUserRepository repository;

  UserPasswordUpdate(this.repository);

  Future<Either<Failure, void>> execute(
      String email, String password, String newpasswordtring) async {
    return await repository.updatePassword(email, password, newpasswordtring);
  }
}
