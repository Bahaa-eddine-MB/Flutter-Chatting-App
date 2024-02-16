import 'package:chat_app/chat-app/domain/usecases/user_send_forgotpassword_usecase.dart';
import 'package:chat_app/chat-app/presentation/controller/login_controller.dart';
import 'package:chat_app/core/global/theme/ColorManager.dart';
import 'package:chat_app/core/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = "";
  bool canSend = true;


  void setEmail(String value){
    email = value;
  }


  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email can't be empty";
    }
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value)) {
      return 'Wrong email format';
    }
    return null;
  }


  getLogin() {
    Get.delete<LoginController>();
    Get.toNamed(
      "/login",
    );
  }

  sendForgotEmail() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (canSend) {
        showLoadingDialogue();

        final userSendForgotPassword = sl<UserSendForgotPassword>();
        final result = await userSendForgotPassword.execute(email);
        result.fold((l) {
          Get.back();
          Get.snackbar("Error", l.message,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM);
        }, (r) async {
          Get.back();
          Get.snackbar("Success", "Email sent succussfuly",
              backgroundColor: ColorManager.primary,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM);
          canSend = false;
          await Future.delayed(const Duration(seconds: 5));
          canSend = true;
        });
      } else {
        Get.snackbar("Alert", "We have already sent you an email",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    }
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
