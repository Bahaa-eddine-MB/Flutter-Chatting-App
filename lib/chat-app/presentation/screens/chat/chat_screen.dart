import 'package:chat_app/chat-app/data/models/UserModel.dart';
import 'package:chat_app/chat-app/presentation/screens/chat/Widget/chat_bubble.dart';
import 'package:chat_app/core/global/theme/ColorManager.dart';
import 'package:chat_app/core/global/theme/StylesManager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              children: [
                ChatBubble(
                    userId: widget.userModel.id,
                    message: "Test message, Hello dude !"),
                ChatBubble(
                    userId: FirebaseAuth.instance.currentUser!.uid,
                    message: "Test message, Hello dude !"),
                ChatBubble(
                    userId: widget.userModel.id,
                    message: "Test message, Hello dude !"),
                ChatBubble(
                    userId: FirebaseAuth.instance.currentUser!.uid,
                    message: "Test message, Hello dude !"),
                ChatBubble(
                    userId: widget.userModel.id,
                    message: "Test message, Hello dude !"),
                ChatBubble(
                    userId: widget.userModel.id,
                    message: "Test message, Hello dude !"),
                ChatBubble(
                    userId: FirebaseAuth.instance.currentUser!.uid,
                    message: "Test message, Hello dude !"),
                ChatBubble(
                    userId: FirebaseAuth.instance.currentUser!.uid,
                    message:
                        "Test message, Hello dude ! Test message, Hello dude !Test message, Hello dude !Test message, Hello dude !"),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: CircleAvatar(
                        backgroundColor: ColorManager.lightTextColor,
                        radius: 50, // Set radius to half the desired size
                        child: const Icon(
                          Icons.person,
                          size: 80,
                          color: Colors.white, // Set the color of the icon
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 220,
                      child: Text(
                        "You are Chatting now with ${widget.userModel.firstName} ${widget.userModel.lastName}",
                        style: getTitleBoldStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type your message",
                  suffixIcon: IconButton(
                icon: const Icon(Icons.send_rounded),
                onPressed: () {},
              )),
            ),
          )
        ],
      ),
    );
  }
}
