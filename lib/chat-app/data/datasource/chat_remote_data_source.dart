import 'package:chat_app/chat-app/data/models/MessageModel.dart';
import 'package:chat_app/core/error/exceptions.dart';
import 'package:chat_app/core/network/error_messae_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseChatRemoteDataSource {
  Future<void> sendMessage(MessageModel message, String chatId);
  Future<String> createChat(String firstEmail, String secondEmail);
}

class RemoteChatDataSource extends BaseChatRemoteDataSource {
  @override
  Future<void> sendMessage(MessageModel message, String chatId) async {
    try {
      final chatRef =
          FirebaseFirestore.instance.collection("chats").doc(chatId);

      await chatRef.collection("messages").add(message.toJson());
    } catch (e) {
      throw const ServerException(
          errorMessageModel:
              ErrorMessageModel(statusMessage: "Something went wrong :("));
    }
  }

  @override
  Future<String> createChat(String firstEmail, String secondEmail) async {
    try {
      final chatCollection = FirebaseFirestore.instance.collection("chats");

      DocumentSnapshot? snapshotWithEmail;

      if (firstEmail == secondEmail) {
        // If firstEmail and secondEmail are the same, search for a chat where users contains firstEmail
        final existingChatSnapshot = await chatCollection
            .where("users", arrayContains: firstEmail)
            .get();

        if (existingChatSnapshot.docs.isNotEmpty) {
          for (var doc in existingChatSnapshot.docs) {
            List<dynamic> users = doc.data()["users"];
            // Check if users contains firstEmail twice
            if (users.where((user) => user == firstEmail).length == 2) {
              snapshotWithEmail = doc;
              break;
            }
          }
        }
      } else {
        // If firstEmail and secondEmail are not the same, use the existing logic
        final existingChatSnapshot = await chatCollection
            .where("users", arrayContains: firstEmail)
            .get();

        if (existingChatSnapshot.docs.isNotEmpty) {
          for (var doc in existingChatSnapshot.docs) {
            List<dynamic> users = doc.data()["users"];
            if (users.contains(secondEmail)) {
              snapshotWithEmail = doc;
              break;
            }
          }
        }
      }

      if (snapshotWithEmail == null) {
        // Create a new chat if no existing chat is found
        final newChat = {
          "users": [firstEmail, secondEmail],
          "createdAt": DateTime.now(),
        };

        final newChatRef = await chatCollection.add(newChat);
        return newChatRef.id; // Return the chat collection ID
      } else {
        return snapshotWithEmail.id;
      }
    } catch (e) {
      throw const ServerException(
        errorMessageModel:
            ErrorMessageModel(statusMessage: "Something went wrong :("),
      );
    }
  }
}
