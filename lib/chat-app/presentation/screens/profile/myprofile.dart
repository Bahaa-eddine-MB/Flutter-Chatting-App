import 'package:chat_app/chat-app/presentation/controller/my_profile_controller.dart';
import 'package:chat_app/chat-app/presentation/screens/profile/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final MyProfileController profileController = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<MyProfileController>(builder: (context) {
          if (profileController.loading == false) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Phone Number:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  profileController.userModel.phone,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                const Text(
                  'First Name:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  profileController.userModel.firstName,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Last Name:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  profileController.userModel.lastName,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Email:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  profileController.userModel.email,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => EditProfilePage(
                            userModel: profileController.userModel,
                          ));
                    },
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        }),
      ),
    );
  }
}
