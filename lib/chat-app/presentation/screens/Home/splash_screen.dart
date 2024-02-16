import 'package:chat_app/chat-app/presentation/controller/splash_screen_controller.dart';
import 'package:chat_app/core/global/theme/ColorManager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashScreenController screenController = Get.find();
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image.asset('assets/logo.png',width: Get.width*.3,),
      ),
    );
  }
}
