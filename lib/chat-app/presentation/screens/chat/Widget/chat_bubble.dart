import 'package:chat_app/core/global/theme/ColorManager.dart';
import 'package:chat_app/core/global/theme/StylesManager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String userSender;
  final String message;

  const ChatBubble(
      {key, required this.userSender, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMine = userSender == FirebaseAuth.instance.currentUser!.email!;
    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: isMine ? 30 : 0, right: !isMine ? 30 : 0,top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color:
              isMine ? ColorManager.primary : Colors.purple[300],
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10),
              bottomLeft: isMine ? const Radius.circular(10) : Radius.zero,
              topRight: const Radius.circular(10),
              bottomRight: isMine ? Radius.zero : const Radius.circular(10)),
        ),
        child: Text(message,style: getRegularTextStyle(color: Colors.white,line: false),),
      ),
    );
  }
}
