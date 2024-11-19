import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/Controllers/LoginController.dart';
import 'package:pas/Pages/Sign.dart';
import 'package:pas/Widget/Button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back(); // Navigasi menggunakan GetX
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1200),
                        child: Text(
                          "Login to your account",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        FadeInUp(
                          duration: const Duration(milliseconds: 1200),
                          child: makeInput(
                              label: "Username",
                              controller: _usernameController),
                        ),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1300),
                          child: makeInput(
                              label: "Password",
                              obscureText: true,
                              controller: _passwordController),
                        ),
                      ],
                    ),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1400),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Button(
                          onPressed: () {
                            final username = _usernameController.text.trim();
                            final password = _passwordController.text.trim();

                            // Validasi input
                            if (username.isEmpty || password.isEmpty) {
                              Get.snackbar(
                                  'Error', 'Username dan Password harus diisi',
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white);
                            } else {
                              // Panggil metode login
                              loginController.login(username, password);
                            }
                          },
                          text: 'Login',
                          colorBg: Colors.greenAccent,
                          colorBorder: Colors.black),
                    ),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1500),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have an account ?"),
                        GestureDetector(
                          onTap: () {
                            // Navigasi ke halaman Sign Up
                            Get.to(() => Sign());
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 1.5),
                            child: const Text(
                              " Sign up",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors
                                    .blue, // Tambahkan warna untuk memberikan efek interaktif
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 1200),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Assets/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeInput(
      {required String label,
      bool obscureText = false,
      required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: obscureText,
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
        const SizedBox(height: 30),
      ],
    );
  }
}
