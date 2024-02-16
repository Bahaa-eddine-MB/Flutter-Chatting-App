import 'package:chat_app/chat-app/presentation/controller/register_controller.dart';
import 'package:chat_app/core/global/theme/ColorManager.dart';
import 'package:chat_app/core/global/theme/StylesManager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController registerController = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            registerController.getToLoginPage();
          },
          icon:  Icon(Icons.arrow_back,color: ColorManager.primary,),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image.asset("assets/logo.png", width: 60, height: 60),
            const SizedBox(height: 30),
            const Text(
              'Create an account',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: registerController.formKey,
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
                    GetBuilder<RegisterController>(builder: (context) {
                      return TextFormField(
                        onChanged: registerController.setEmail,
                        validator: registerController.validateEmail,
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
                    GetBuilder<RegisterController>(builder: (context) {
                      return TextFormField(
                        obscureText: registerController.securedPassword,
                        onChanged: registerController.setPassword,
                        validator: registerController.passwordValidator,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                registerController.setSecuredPassword();
                              },
                              icon: Icon(!registerController.securedPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          hintText: 'Enter your password',
                          border: const OutlineInputBorder(),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Confirm Password:",
                          style: getTitleBoldStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GetBuilder<RegisterController>(builder: (context) {
                      return TextFormField(
                        obscureText: registerController.securedPassword,
                        onChanged: registerController.setConfirmPassword,
                        validator: registerController.validateNewPassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                registerController.setSecuredPassword();
                              },
                              icon: Icon(!registerController.securedPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          hintText: 'Confirm your password',
                          border: const OutlineInputBorder(),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Phone Number:",
                          style: getTitleBoldStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GetBuilder<RegisterController>(builder: (context) {
                      return TextFormField(
                        keyboardType: TextInputType.phone,
                        onChanged: registerController.setPhone,
                        validator: registerController.phoneNumberValidator,
                        decoration: const InputDecoration(
                          hintText: '00-00-00-00-00',
                          border: OutlineInputBorder(),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "First name:",
                          style: getTitleBoldStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GetBuilder<RegisterController>(builder: (context) {
                      return TextFormField(
                        onChanged: registerController.setFirst,
                        validator: registerController.validateNamer,
                        decoration: const InputDecoration(
                          hintText: 'Your first name',
                          border: OutlineInputBorder(),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Last name:",
                          style: getTitleBoldStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GetBuilder<RegisterController>(builder: (context) {
                      return TextFormField(
                        onChanged: registerController.setLast,
                        validator: registerController.validateNamer,
                        decoration: const InputDecoration(
                          hintText: 'Your last name',
                          border: OutlineInputBorder(),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          registerController.submitForm();
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            registerController.getToLoginPage();
                          },
                          child: const Text('Login'),
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