import 'package:chat_app/chat-app/presentation/route_manager.dart';
import 'package:chat_app/chat-app/presentation/screens/Auth/login_page.dart';
import 'package:chat_app/core/global/theme/ThemeManager.dart';
import 'package:chat_app/core/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat app',
      theme: getApplicationThemData(),
      initialRoute: "/splash",
      getPages: Routes.routes,
      home: const LoginPage(),
    );
  }
}
