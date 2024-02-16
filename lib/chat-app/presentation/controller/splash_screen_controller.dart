import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  void whereToGo() {
    if (FirebaseAuth.instance.currentUser != null) {
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        Get.offAllNamed('/home');
      } else {
        Get.offAllNamed('/validate');
      }
    } else {
      Get.offAllNamed('/login');
    }
  }

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () => whereToGo());
    super.onInit();
  }
}
