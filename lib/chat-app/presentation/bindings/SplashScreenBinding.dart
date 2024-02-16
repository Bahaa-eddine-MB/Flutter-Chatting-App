import 'package:chat_app/chat-app/presentation/controller/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashScreenController>(SplashScreenController());
  }
}