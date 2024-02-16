import 'package:chat_app/chat-app/data/models/UserModel.dart';
import 'package:chat_app/chat-app/presentation/controller/edit_profile_controller.dart';
import 'package:chat_app/core/global/theme/StylesManager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({key, required this.userModel}) : super(key: key);
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    final EditProfileController editProfileController =
        Get.put(EditProfileController(userModel));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: editProfileController.formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "First name:",
                      style: getTitleBoldStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: editProfileController.validateNamer,
                  controller: editProfileController.firstNameController,
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Last name:",
                      style: getTitleBoldStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: editProfileController.validateNamer,
                  controller: editProfileController.lastNameController,
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Phone Number:",
                      style: getTitleBoldStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: editProfileController.phoneNumberValidator,
                  controller: editProfileController.phoneController,
                  decoration: const InputDecoration(
                    hintText: 'Phone Number',
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      editProfileController.submitForm();
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
