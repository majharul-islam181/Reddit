import 'package:flutter/material.dart';
import 'package:reddit/core/common/sign_in_button.dart';
import 'package:reddit/core/constants/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Constants.logoPath,
          height: 40,
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Skip",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            "Dive into anything",
            style: TextStyle(
                fontWeight: FontWeight.bold, letterSpacing: 0.5, fontSize: 24),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(Constants.logoEmotePath, height: 400),
          ),
          const SizedBox(height: 30),
          SignInButton(),
        ],
      ),
    );
  }
}
