import 'package:chat_app/chat-app/presentation/controller/login_controller.dart';
import 'package:chat_app/chat-app/presentation/controller/register_controller.dart';
import 'package:chat_app/core/global/theme/StylesManager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Image.asset("assets/logo.png", width: 130, height: 130),
            const SizedBox(height: 30),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: loginController.formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Email:",
                          style: getTitleBoldStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GetBuilder<LoginController>(builder: (context) {
                      return TextFormField(
                        onChanged: loginController.setEmail,
                        validator: loginController.validateEmail,
                        decoration: const InputDecoration(
                          hintText: 'example@gmail.com',
                          border: OutlineInputBorder(),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Password:",
                          style: getTitleBoldStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GetBuilder<LoginController>(builder: (context) {
                      return TextFormField(
                        obscureText: loginController.securedPassword,
                        onChanged: loginController.setUserPassword,
                        validator: loginController.passwordValidator,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                loginController.invertSecuredPassword();
                              },
                              icon: Icon(!loginController.securedPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          hintText: 'Enter your password',
                          border: const OutlineInputBorder(),
                        ),
                      );
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.delete<LoginController>();
                            Get.toNamed('/forgot_password');
                          },
                          child: const Text('Forgot password?'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          loginController.signInAUser();
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                          onPressed: () {
                            Get.delete<LoginController>();
                            Get.delete<RegisterController>();
                            Get.toNamed('/register');
                          },
                          child: const Text('Register'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
