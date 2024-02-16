import 'package:chat_app/chat-app/presentation/controller/verify_email_controller.dart';
import 'package:get/get.dart';


class VerifyEmailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<VerifyEmailController>(VerifyEmailController());
  }
}