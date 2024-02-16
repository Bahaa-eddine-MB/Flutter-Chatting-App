import 'package:chat_app/chat-app/data/datasource/chat_remote_data_source.dart';
import 'package:chat_app/chat-app/data/models/MessageModel.dart';
import 'package:chat_app/chat-app/data/models/UserModel.dart';
import 'package:chat_app/chat-app/domain/repository/base_chat_repository.dart';
import 'package:chat_app/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';

class ChatRepository implements BaseChatRepository {
  final BaseChatRemoteDataSource baseremoteDataSource;
  ChatRepository(this.baseremoteDataSource);

  @override
  Future<Either<Failure, String>> createChat(
      String firstEmail, String secondEmail) async {
    try {
      final chatId =
          await baseremoteDataSource.createChat(firstEmail, secondEmail);
      return Right(chatId);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> sendMessage(
      MessageModel message, String chatId) async {
    try {
      await baseremoteDataSource.sendMessage(message, chatId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }
}
