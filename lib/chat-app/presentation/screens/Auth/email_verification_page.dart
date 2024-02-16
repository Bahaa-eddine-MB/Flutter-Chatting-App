import 'package:chat_app/chat-app/presentation/controller/verify_email_controller.dart';
import 'package:chat_app/core/global/theme/StylesManager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerficationScreen extends StatelessWidget {
  const EmailVerficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyEmailController verifyEmailController = Get.find();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Image.asset(
              "assets/email.png",
              height: 150,
              width: 150,
            ),
            const Spacer(),
            Text(
              "Please check your email and click on the link to verify your email address",
              style: getTitleBoldStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  verifyEmailController.rsendEmail();
                },
                child: const Text(
                  'Resend Email',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                verifyEmailController.goBacktoLogin();
              },
              child: const Text('Go back to login'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
