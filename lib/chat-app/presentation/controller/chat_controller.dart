import 'package:chat_app/chat-app/data/models/MessageModel.dart';
import 'package:chat_app/chat-app/domain/usecases/chat_create_chat_usecase.dart';
import 'package:chat_app/chat-app/domain/usecases/chat_send_message.dart';
import 'package:chat_app/core/service/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final String firstEmail;
  final String secondEmail;
  TextEditingController messageController = TextEditingController();
  ChatController(this.firstEmail, this.secondEmail);

  bool loading = true;

  void setLoading(bool value) {
    loading = value;
    update();
  }

  String chatId = "";

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      final sendMessage = sl<SendMessage>();
      final result = await sendMessage.execute(
          MessageModel(
              message: messageController.text,
              date: DateTime.now(),
              sender: FirebaseAuth.instance.currentUser!.uid),
          chatId);

      result.fold((l) {
        Get.snackbar("Error", l.message,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }, (r) {
        messageController.text = "";
      });
    }
  }

  void createChat() async {
    final createChat = sl<CreateChat>();
    final result = await createChat.execute(firstEmail, secondEmail);

    result.fold((l) {
      setLoading(false);
      Get.snackbar("Error", l.message,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }, (r) {
      chatId = r;
      setLoading(false);
    });
  }

  @override
  void onInit() {
    createChat();
    super.onInit();
  }
}
