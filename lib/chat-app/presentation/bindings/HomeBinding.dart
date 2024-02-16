import 'package:chat_app/chat-app/presentation/controller/home_page_controller.dart';
import 'package:get/get.dart';


class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(),permanent: true);
  }
}