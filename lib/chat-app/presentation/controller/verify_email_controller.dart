import 'dart:async';

import 'package:chat_app/chat-app/domain/usecases/user_isverified_usecase.dart';
import 'package:chat_app/chat-app/domain/usecases/user_logout_usecase.dart';
import 'package:chat_app/chat-app/domain/usecases/user_send_email_usecase.dart';
import 'package:chat_app/core/global/theme/ColorManager.dart';
import 'package:chat_app/core/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  Timer? timer;
  bool loading = false;
  bool canSendEmail = true;

  @override
  void onInit() {
    super.onInit();
    rsendEmail();
    isEmailVeified();
  }

  void rsendEmail() async {
    if (canSendEmail) {
      showLoadingDialogue();
      final userSendEmail = sl<UserSendEmail>();
      final result = await userSendEmail.execute();
      result.fold((l) {
        Get.back();
        Get.snackbar("Error", l.message,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }, (r) async {
        Get.back();
        Get.snackbar("Success", "Email sent successfuly",
            backgroundColor: ColorManager.primary,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
        canSendEmail = false;
        await Future.delayed(const Duration(seconds: 5));
        canSendEmail = true;
      });
    } else {
      Get.snackbar("Alert", "An email has already been sent !",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void isEmailVeified() {
    final isEmailVerified = sl<UserVerified>();
    timer = Timer.periodic(const Duration(seconds: 5), (_) async {
      final result = await isEmailVerified.execute();
      result.fold((l) => null, (r) {
        if (r) {
          timer?.cancel();
          Get.offAllNamed("/home");
        }
      });
    });
  }

  void goBacktoLogin() async {
    final userLogout = sl<UserLogOut>();
    final result = await userLogout.execute();
    result.fold((l) => null, (r) {
      Get.offAllNamed("/login");
    });
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
