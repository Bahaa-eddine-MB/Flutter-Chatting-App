import 'package:chat_app/chat-app/data/models/UserModel.dart';
import 'package:chat_app/chat-app/domain/usecases/user_get_user_byId.dart';
import 'package:chat_app/core/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
 final String userId;
  ProfileController({required this.userId});

  bool loading = true;
  UserModel userModel = const UserModel(email: '',firstName: '',id: '',lastName: '',phone: '');

  void setLoading(bool value){
    loading = value;
    update();
  }

  void fetchUsers() async {
    final getUser = sl<GetUserByID>();
    showLoadingDialogue();

    final result = await getUser.execute(userId);
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
      userModel = r;
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
