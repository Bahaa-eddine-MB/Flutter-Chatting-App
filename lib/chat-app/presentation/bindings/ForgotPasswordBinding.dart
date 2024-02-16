import 'package:chat_app/chat-app/presentation/controller/forgot_password.controller.dart';
import 'package:get/get.dart';


class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(()=>ForgotPasswordController());
  }
}
