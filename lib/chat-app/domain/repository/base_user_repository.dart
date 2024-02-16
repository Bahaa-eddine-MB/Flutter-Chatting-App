import 'package:chat_app/chat-app/data/models/UserModel.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';

abstract class BaseUserRepository {
  Future<Either<Failure, UserModel>> registerNewUser(String firstName,
      String lastName, String phone, String password, String email);
  Future<Either<Failure, UserModel>> login(String email, String password);
  Future<Either<Failure, UserModel>> updateUser(
      String firstName, String lastName, String phone, String email);
  Future<Either<Failure, void>> updatePassword(
      String email, String password, String newpassword);
  Future<Either<Failure, void>> deleteAccount(String email, String password);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> verifyEmail();
  Future<Either<Failure, void>> sendForgotEmail(String email);
  Future<Either<Failure, bool>> isUserVerified();
  Future<Either<Failure, List<UserModel>>> getAllUsers();
  Future<Either<Failure,UserModel>> getUserById(String userId);
}
