import 'package:chat_app/chat-app/data/models/UserModel.dart';
import 'package:chat_app/chat-app/presentation/controller/chat_history_controller.dart';
import 'package:chat_app/chat-app/presentation/screens/chat/chat_screen.dart';
import 'package:chat_app/core/global/theme/StylesManager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatHistoryController chatHistoryController =
        Get.put(ChatHistoryController());
    return RefreshIndicator(
      backgroundColor: Colors.grey[900],
      onRefresh: () {
        chatHistoryController.fetchData();
        return Future<void>.value();
      },
      child: GetBuilder<ChatHistoryController>(builder: (context) {
        if (chatHistoryController.loading) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [CircularProgressIndicator(), Text("Loading...")],
            ),
          );
        }
        if (chatHistoryController.myChats.isEmpty) {
          return const Center(child: Text("You have no chats"));
        }
        if (chatHistoryController.myChats.isNotEmpty) {
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "My chats :",
                style: getTitleSemiBoldStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: chatHistoryController.myChats.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final chat = chatHistoryController.myChats[index];
                  final firstEmail = chat.users[0];
                  final secondEmail = chat.users[1];
                  bool emailsEqual = firstEmail == secondEmail;
                  return ListTile(
                    onTap: () {
                      Get.to(() => ChatScreen(
                            goTopProfile: false,
                            userModel: UserModel(
                                id: '',
                                firstName: emailsEqual
                                    ? firstEmail
                                    : chat.users.firstWhere((element) =>
                                        element != chatHistoryController.email),
                                lastName: '',
                                phone: '',
                                email: emailsEqual
                                    ? firstEmail
                                    : chat.users.firstWhere((element) =>
                                        element !=
                                        chatHistoryController.email)),
                          ));
                    },
                    leading: const Icon(
                      Icons.account_circle,
                      size: 40,
                    ),
                    title: Text(emailsEqual
                        ? "Me"
                        : chat.users.firstWhere((element) =>
                            element != chatHistoryController.email)),
                    subtitle: Text(DateFormat('yyyy, MMM d, HH:mm')
                        .format(chat.createdAt)),
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
