import 'package:chat_app/chat-app/presentation/controller/home_page_controller.dart';
import 'package:chat_app/chat-app/presentation/controller/profile_controller.dart';
import 'package:chat_app/chat-app/presentation/screens/chat/chat_screen.dart';
import 'package:chat_app/chat-app/presentation/screens/profile/profile_page.dart';
import 'package:chat_app/core/global/theme/StylesManager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return RefreshIndicator(
      backgroundColor: Colors.grey[900],
      onRefresh: (){
        homeController.fetchUsers();
        return Future<void>.value();
      },
      child: GetBuilder<HomeController>(builder: (context) {
        if (homeController.users.isNotEmpty) {
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "List of users :",
                style: getTitleSemiBoldStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: homeController.users.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final user = homeController.users[index];
                  return ListTile(
                    onTap: () {
                      //Get.delete<ProfileController>();
                      Get.to(ChatScreen(userModel: user,));
                     // Get.to(ProfilePage(id: user.id));
                    },
                    leading: const Icon(
                      Icons.account_circle,
                      size: 40,
                    ),
                    title: Text("${user.firstName} ${user.lastName}"),
                    subtitle: Text(user.email),
                  );
                },
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
