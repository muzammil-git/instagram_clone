import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';

import '../widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailCtrl.dispose();
    passCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //SVG image
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: Colors.white,
              ),

              SizedBox(
                height: 64,
              ),

              // Email
              TextFieldInput(
                hintText: 'Enter your email',
                textEditingController: emailCtrl,
                textInputType: TextInputType.emailAddress,
              ),

              const SizedBox(
                height: 24,
              ),

              // Password
              TextFieldInput(
                hintText: 'Enter your Password',
                textEditingController: passCtrl,
                textInputType: TextInputType.text,
                isPass: true,
              ),

              const SizedBox(
                height: 16,
              ),
              // Button login
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Log in"),
                ),
              ),

              Flexible(
                child: Container(),
                flex: 2,
              ),

              // Transitioning to signing up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 02),
                    child: const Text(
                      "Don't have an account?",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 02),
                      child: const Text(
                        "Sign Up.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
