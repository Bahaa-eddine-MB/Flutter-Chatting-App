import 'package:chat_app/chat-app/data/models/UserModel.dart';
import 'package:chat_app/chat-app/presentation/controller/chat_controller.dart';
import 'package:chat_app/chat-app/presentation/screens/chat/Widget/chat_bubble.dart';
import 'package:chat_app/chat-app/presentation/screens/profile/profile_page.dart';
import 'package:chat_app/core/global/theme/ColorManager.dart';
import 'package:chat_app/core/global/theme/StylesManager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {Key? key, required this.userModel, required this.goTopProfile})
      : super(key: key);
  final UserModel userModel;
  final bool goTopProfile;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatController chatController;

  @override
  void initState() {
    super.initState();
    chatController = Get.put(ChatController(
        FirebaseAuth.instance.currentUser?.email ?? '',
        widget.userModel.email));
  }

  @override
  Widget build(BuildContext context) {
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
            Text("${widget.userModel.firstName} ${widget.userModel.lastName}"),
          ],
        ),
      ),
      body: GetBuilder<ChatController>(builder: (context) {
        if (chatController.loading == false) {
          final messages = FirebaseFirestore.instance
              .collection("chats")
              .doc(chatController.chatId)
              .collection("messages")
              .orderBy("date", descending: true);

          return Column(
            children: [
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: messages.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // Handle the chat data
                      final docs = snapshot.data!.docs;
                      return ListView.builder(
                        reverse: true,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        itemCount: docs.length + 1,
                        itemBuilder: (context, index) {
                          if (index == docs.length) {
                            return Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 30),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        ColorManager.lightTextColor,
                                    radius:
                                        50, // Set radius to half the desired size
                                    child: const Icon(
                                      Icons.person,
                                      size: 80,
                                      color: Colors
                                          .white, // Set the color of the icon
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (widget.goTopProfile) {
                                      Get.to(() =>
                                          ProfilePage(id: widget.userModel.id));
                                    }
                                  },
                                  child: SizedBox(
                                    width: 220,
                                    child: Text(
                                      widget.userModel.email ==
                                              FirebaseAuth
                                                  .instance.currentUser!.email
                                          ? "You are Chatting with yourself"
                                          : "You are Chatting now with ${widget.userModel.firstName} ${widget.userModel.lastName}",
                                      style: getTitleBoldStyle(
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            );
                          }
                          final message = docs[index];
                          return ChatBubble(
                            message: message['message'],
                            userSender: message['sender'],
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      // Handle the error
                      return Text('Error: ${snapshot.error}');
                    } else {
                      // Show a loading indicator
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator()),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Loading chat..."),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onSubmitted: (String value) {
                    chatController.sendMessage();
                  },
                  controller: chatController.messageController,
                  decoration: InputDecoration(
                      hintText: "Type your message",
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send_rounded),
                        onPressed: () {
                          chatController.sendMessage();
                        },
                      )),
                ),
              )
            ],
          );
        } else {
          return const Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              Text("Looking for your chat..."),
            ],
          ));
        }
      }),
    );
  }
}
