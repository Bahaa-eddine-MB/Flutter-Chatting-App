import 'package:chat_app/chat-app/presentation/controller/edit_profile_controller.dart';
import 'package:get/get.dart';


class EditProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(()=>EditProfileController());
  }
}
