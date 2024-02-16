import 'package:chat_app/chat-app/data/models/UserModel.dart';
import 'package:chat_app/chat-app/domain/usecases/user_update_usecase.dart';
import 'package:chat_app/chat-app/presentation/controller/my_profile_controller.dart';
import 'package:chat_app/core/global/theme/ColorManager.dart';
import 'package:chat_app/core/service/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final UserModel userModel;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final MyProfileController myProfileController =
      Get.find<MyProfileController>();

  EditProfileController(this.userModel);

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

  submitForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final updateUser = sl<UserUpdate>();
      showLoadingDialogue();
      final result = await updateUser.execute(
          firstNameController.text,
          lastNameController.text,
          phoneController.text,
          FirebaseAuth.instance.currentUser!.email ?? '');
      result.fold((l) {
        Get.back();
        Get.snackbar("Error", l.message,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }, (r) async {
        Get.back();
        Get.snackbar("Success", "Profile updated successfully",
            backgroundColor: ColorManager.primary,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
        myProfileController.fetchUsers(true);
      });
    }
  }

  @override
  void onInit() {
    firstNameController.text = userModel.firstName;
    lastNameController.text = userModel.lastName;
    phoneController.text = userModel.phone;
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
