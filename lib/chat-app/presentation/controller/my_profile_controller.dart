import 'package:chat_app/chat-app/data/models/UserModel.dart';
import 'package:chat_app/chat-app/domain/usecases/user_get_user_byId.dart';
import 'package:chat_app/core/service/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileController extends GetxController {
  bool loading = true;
  String userId = FirebaseAuth.instance.currentUser!.uid;
  late UserModel userModel;

  void setLoading(bool value) {
    loading = value;
    update();
  }

  void fetchUsers(bool isEdit) async {
    final getUser = sl<GetUserByID>();
    if (isEdit) {
      showLoadingDialogue();
    }

    final result = await getUser.execute(userId);
    result.fold((l) {
      setLoading(false);
      Get.back();
      Get.snackbar("Error", l.message,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }, (r) async {
      if (isEdit) {
        Get.back();
      }

      setLoading(false);
      userModel = r;
      update();
    });
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchUsers(false);
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
