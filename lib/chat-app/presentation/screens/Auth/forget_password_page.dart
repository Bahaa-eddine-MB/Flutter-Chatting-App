import 'package:chat_app/chat-app/presentation/controller/forgot_password.controller.dart';
import 'package:chat_app/core/global/theme/StylesManager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController forgotPasswordController = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: forgotPasswordController.formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  "assets/email.png",
                  height: 150,
                  width: 150,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Please enter your email so we can send you a reset emal",
                  style: getTitleBoldStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
               const SizedBox(
                  height: 40,
                ),
                GetBuilder<ForgotPasswordController>(builder: (context) {
                  return TextFormField(
                    onChanged: forgotPasswordController.setEmail,
                    validator: forgotPasswordController.validateEmail,
                    decoration: const InputDecoration(
                      hintText: 'example@gmail.com',
                      border: OutlineInputBorder(),
                    ),
                  );
                }),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      forgotPasswordController.sendForgotEmail();
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
                    forgotPasswordController.getLogin();
                  },
                  child: const Text('Go back to login'),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
