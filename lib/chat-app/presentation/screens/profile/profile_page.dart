import 'package:chat_app/chat-app/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController =
        Get.put(ProfileController(userId: id,));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<ProfileController>(builder: (context) {
          if (!profileController.loading) {
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
