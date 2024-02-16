import 'package:chat_app/chat-app/data/models/UserModel.dart';
import 'package:chat_app/core/error/exceptions.dart';
import 'package:chat_app/chat-app/data/datasource/user_remote_datasource.dart';
import 'package:chat_app/chat-app/domain/repository/base_user_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';

class UserRepository implements BaseUserRepository {
  final BaseRemoteDataSource baseremoteDataSource;
  UserRepository(this.baseremoteDataSource);

  @override
  Future<Either<Failure, UserModel>> registerNewUser(String firstName,
      String lastName, String phone, String password, String email) async {
    try {
      final result = await baseremoteDataSource.registerNewUser(
          firstName, lastName, phone, password, email);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UserModel>> login(
      String email, String password) async {
    try {
      final result = await baseremoteDataSource.login(email, password);

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await baseremoteDataSource.logout();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount(
      String email, String password) async {
    try {
      await baseremoteDataSource.deleteAccount(email, password);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword(
      String email, String password, String newpassword) async {
    try {
      await baseremoteDataSource.updatePassword(email, password, newpassword);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUser(
      String firstName, String lastName, String phone, String email) async {
    try {
      final reuslt = await baseremoteDataSource.updateUser(
          firstName, lastName, phone, email);
      return Right(reuslt);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> verifyEmail() async {
    try {
      await baseremoteDataSource.verifyEmail();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, bool>> isUserVerified() async {
    try {
      final result = await baseremoteDataSource.isUserVerified();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> sendForgotEmail(String email) async {
    try {
      await baseremoteDataSource.sendForgotEmail(email);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> getAllUsers() async {
    try {
      final users = await baseremoteDataSource.getAllUsers();
      return Right(users);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserById(String userId) async {
    try {
      final user = await baseremoteDataSource.getUserById(userId);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }
}
