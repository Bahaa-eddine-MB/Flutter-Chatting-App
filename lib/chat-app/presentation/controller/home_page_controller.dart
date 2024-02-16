import 'package:chat_app/chat-app/data/models/UserModel.dart';
import 'package:chat_app/chat-app/domain/usecases/user_get_all.dart';
import 'package:chat_app/core/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int pageIndex = 1;
  List<UserModel> users = [];

  void setPageIndex(int value) {
    pageIndex = value;
    update();
  }

  void fetchUsers() async {
    final getAllusers = sl<UserGetAll>();
    showLoadingDialogue();

    final result = await getAllusers.execute();
    result.fold((l) {
      Get.back();
      Get.snackbar("Error", l.message,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }, (r) async {
      Get.back();
      users = r;
      update();
    });
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchUsers();
    });
    super.onInit();
  }
}

showLoadingDialogue() {
  showDialog(
    context: Get.overlayContext!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
