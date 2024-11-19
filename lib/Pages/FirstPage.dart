import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/Widget/Button.dart';

import 'Login.dart';
import 'Sign.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: const Text(
                      "Welcome",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1200),
                    child: Text(
                      "Automatic identity verification which enables you to verify your identity",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              FadeInUp(
                duration: const Duration(milliseconds: 1400),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('Assets/illustration.png'),
                    ),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  FadeInUp(
                      duration: const Duration(milliseconds: 1500),
                      child: Button(
                          onPressed: () {
                            Get.to(() => const Login());
                          },
                          text: "Login",
                          colorBg: Colors.transparent,
                          colorBorder: Colors.black)),
                  const SizedBox(height: 20),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1600),
                      child: Button(
                          onPressed: () {
                            Get.to(() => Sign());
                          },
                          text: 'Sign Up',
                          colorBg: Colors.yellow,
                          colorBorder: Colors.black))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
