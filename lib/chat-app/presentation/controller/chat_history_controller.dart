import 'package:chat_app/chat-app/data/models/ChatModel.dart';
import 'package:chat_app/chat-app/domain/usecases/chat_getmy_chats_usecase.dart';
import 'package:chat_app/core/service/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatHistoryController extends GetxController {
  List<ChatModel> myChats = [];
  bool loading = true;
  final String email = FirebaseAuth.instance.currentUser!.email!;

  void setLoading(bool value) {
    loading = value;
    update();
  }

  void fetchData() async {
    final getMyChats = sl<GetMyChats>();
    final result = await getMyChats.execute(email);
    result.fold((l) {
      setLoading(false);
      Get.back();
      Get.snackbar("Error", l.message,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }, (r) async {
      Get.back();
      setLoading(false);
      myChats = r;
      update();
    });
  }



  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
