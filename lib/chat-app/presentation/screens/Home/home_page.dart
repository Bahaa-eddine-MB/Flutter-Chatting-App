import 'package:chat_app/chat-app/presentation/controller/home_page_controller.dart';
import 'package:chat_app/chat-app/presentation/screens/Home/chat_history.dart';
import 'package:chat_app/chat-app/presentation/screens/Home/users_page.dart';
import 'package:chat_app/chat-app/presentation/screens/profile/myprofile.dart';
import 'package:chat_app/chat-app/presentation/screens/profile/profile_page.dart';
import 'package:chat_app/core/global/theme/ColorManager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("Chat App"),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Center(
            child: ElevatedButton(
          child: const Text("sing out"),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Get.offAllNamed('/login');
          },
        )),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(builder: (context) {
        return BottomNavigationBar(
          elevation: 0,
          currentIndex: homeController.pageIndex,
          onTap: (value) => homeController.setPageIndex(value),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.maps_home_work_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chats",
            ),
          ],
        );
      }),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return IndexedStack(
            index: homeController.pageIndex,
            children: [
              MyProfilePage(),
              const UsersPage(),
              const ChatHistoryPage(),
            ],
          );
        },
      ),
    );
  }
}
