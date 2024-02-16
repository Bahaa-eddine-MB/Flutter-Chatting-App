import 'package:chat_app/chat-app/presentation/bindings/ForgotPasswordBinding.dart';
import 'package:chat_app/chat-app/presentation/bindings/HomeBinding.dart';
import 'package:chat_app/chat-app/presentation/bindings/LoginBinding.dart';
import 'package:chat_app/chat-app/presentation/bindings/RegisterBinding.dart';
import 'package:chat_app/chat-app/presentation/bindings/SplashScreenBinding.dart';
import 'package:chat_app/chat-app/presentation/bindings/VerifyEmailBinding.dart';
import 'package:chat_app/chat-app/presentation/screens/Auth/email_verification_page.dart';
import 'package:chat_app/chat-app/presentation/screens/Auth/forget_password_page.dart';
import 'package:chat_app/chat-app/presentation/screens/Auth/login_page.dart';
import 'package:chat_app/chat-app/presentation/screens/Auth/register_page.dart';
import 'package:chat_app/chat-app/presentation/screens/Home/chat_history.dart';
import 'package:chat_app/chat-app/presentation/screens/Home/home_page.dart';
import 'package:chat_app/chat-app/presentation/screens/Home/splash_screen.dart';
import 'package:chat_app/chat-app/presentation/screens/profile/edit_profile_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String splash = "/splash";
  static const String loginScreen = "/login";
  static const String registerScreen = "/register";
  static const String forgotPassword = "/forgot_password";
  static const String homePage = "/home";
  static const String validateScreen = "/validate";
  static const String editProfile = "/edit_profile";
  static const String profile = "/profile";
  static const String chat = "/chat";
  static const String historyChats = "/history_chats";
  
  static List<GetPage> routes = [
    GetPage(
      name: homePage,
      transition: Transition.fadeIn,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: loginScreen,
        transition: Transition.fadeIn,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: validateScreen,
        transition: Transition.fadeIn,
        page: () => const EmailVerficationScreen(),
        binding: VerifyEmailBinding()),
    GetPage(
        name: registerScreen,
        page: () => const RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: forgotPassword,
        page: () => const ForgotPassword(),
        binding: ForgotPasswordBinding()),
    GetPage(name: historyChats, page: () => const ChatHistoryPage()),
  ];
}
