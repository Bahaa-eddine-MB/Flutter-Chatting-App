import 'package:chat_app/chat-app/domain/usecases/user_register_usecase.dart';
import 'package:chat_app/chat-app/domain/usecases/user_send_email_usecase.dart';
import 'package:chat_app/chat-app/presentation/controller/login_controller.dart';
import 'package:chat_app/core/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool securedPassword = true;
  String password = "";
  String email = "";
  String phone = "";
  String first = "";
  String last = "";
  String confirmPassword = "";

  setPhone(input) {
    phone = input;
  }
  setEmail(input) {
    email = input;
  }

  setFirst(input) {
    first = input;
  }

  setSecuredPassword() {
    securedPassword = !securedPassword;
    update();
  }

  setLast(input) {
    last = input;
  }

  setPassword(input) {
    password = input;
  }

  setConfirmPassword(input) {
    confirmPassword = input;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Password can't be empty";
    }
    if (value.length < 8) {
      return "Password can't be less than 8 characters";
    }
    if (value.length > 20) {
      return "Password too long".tr;
    }
    return null;
  }

  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone can't be empty";
    }

    final cleanedNumber = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleanedNumber.length != 10) {
      return 'Phone should be 10 digits';
    }

    return null;
  }

  String? validateNamer(String? value) {
    if (value == null || value.isEmpty) {
      return "Field can't be empty";
    }
    if (value.length < 3) {
      return "Field can't be less than 3 characters";
    }
    return null;
  }

  String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty || value != password) {
      return 'Wrong password';
    }
    return null;
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

  getToLoginPage() async {
    Get.delete<LoginController>();
    Get.toNamed(
      "/login",
    );
  }

  submitForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final userRegister = sl<UserRegister>();
      final userSendEmail = sl<UserSendEmail>();
      showLoadingDialogue();
      final result = await userRegister.execute(
          first.trim(), last.trim(), phone.trim(), password, email.trim());
      result.fold((l) {
        Get.back();
        Get.snackbar("Error", l.message,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }, (r) async {
        Get.back();
        final result = await userSendEmail.execute();
        result.fold(
            (l) => {
                  Get.snackbar("Error", l.message,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM)
                }, (r) {
          Get.offAndToNamed("/validate");
        });
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
