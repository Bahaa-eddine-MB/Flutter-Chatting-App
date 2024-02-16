import 'package:chat_app/chat-app/domain/usecases/user_login_usecase.dart';
import 'package:chat_app/chat-app/presentation/controller/forgot_password.controller.dart';
import 'package:chat_app/chat-app/presentation/controller/register_controller.dart';
import 'package:chat_app/core/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool securedPassword = true;
  bool loginError = false;
  String password = "password";
  String email = "";

  setUserPassword(inputPassword) {
    password = inputPassword;
    loginError = false;
  }

  setEmail(input) {
    email = input;
    loginError = false;
  }

  createOne() {
    Get.delete<RegisterController>();
    Get.toNamed("/register");
  }

  invertSecuredPassword() {
    securedPassword = !securedPassword;
    update();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email can't be empty";
    }
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return 'Wrong email format';
    }
    return null;
  }

  String? passwordValidator(String? inputPassword) {
    if (inputPassword!.isEmpty) {
      return "Password can't be empty";
    }
    if (inputPassword.length < 8) {
      return "Password can't be less than 8 characters";
    }
    return null;
  }

  getToForgetPasswrodPage() async {
    Get.delete<ForgotPasswordController>();
    Get.toNamed(
      "/forgot_password",
    );
  }

  signInAUser() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final userLogin = sl<UserLogin>();
      showLoadingDialogue();

      final result = await userLogin.execute(
        email.trim(),
        password.trim(),
      );
      result.fold((l) {
        Get.back();
        Get.snackbar("Error", l.message,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }, (r) async {
        Get.back();
        Get.offAllNamed("/home");
      });
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
