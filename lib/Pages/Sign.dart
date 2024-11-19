import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/Controllers/SignController.dart';
import 'package:pas/Pages/Login.dart';
import 'package:pas/Widget/Button.dart';

class Sign extends StatelessWidget {
  final Signcontroller controller = Get.put(Signcontroller());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  Sign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1200),
                    child: Text(
                      "Create an account, It's free",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  FadeInUp(
                    duration: const Duration(milliseconds: 1200),
                    child: makeInput(
                      label: "Username",
                      onChanged: (value) => controller.username.value = value,
                      controller: usernameController,
                    ),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1300),
                    child: makeInput(
                      label: "Password",
                      onChanged: (value) => controller.password.value = value,
                      controller: emailController,
                    ),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1400),
                    child: makeInput(
                      label: "Full_Name",
                      obscureText: true,
                      onChanged: (value) => controller.fullName.value = value,
                      controller: passwordController,
                    ),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1600),
                    child: makeInput(
                      label: "Email",
                      onChanged: (value) => controller.email.value = value,
                      controller: fullNameController,
                    ),
                  ),
                ],
              ),
              FadeInUp(
                duration: const Duration(milliseconds: 1500),
                child: Button(
                    onPressed: () {
                      controller.register();
                    },
                    text: 'Sign Up',
                    colorBg: Colors.greenAccent,
                    colorBorder: Colors.black),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 60),
                child: FadeInUp(
                  duration: const Duration(milliseconds: 1600),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Already have an account?"),
                      GestureDetector(
                        onTap: () {
                          // Navigasi ke halaman login
                          Get.to(() => const Login());
                        },
                        child: const Text(
                          " Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput({
    required String label,
    bool obscureText = false,
    required Function(String) onChanged,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
