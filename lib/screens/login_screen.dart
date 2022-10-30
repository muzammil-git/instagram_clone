import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/resource/auth_methods.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';

import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_screen_layout.dart';
import '../widgets/text_field_input.dart';
import 'home_screen.dart';

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

  void loginUser() async {
    String res = await AuthMethods()
        .loginUser(email: emailCtrl.text, password: passCtrl.text);

    if (res == "success") {
      // showSnackBar(res, context);
       // ignore: use_build_context_synchronously
       Navigator.pushReplacement(
        context, MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            webScreenLayout: WebScreenLayout(), 
            mobileScreenLayout: MobileScreenLayout())
      ));
    } else {
      
      showSnackBar(res, context);
    }
  }

  bool isLoading = false;

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
                flex: 2,
                child: Container(),
              ),
              //SVG image
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: Colors.white,
              ),

              const SizedBox(
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
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    String res = await AuthMethods().loginUser(
                      email: emailCtrl.text,
                      password: passCtrl.text,
                    );

                    if (res == "success") {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    } else {
                      showSnackBar(res, context);
                    }

                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: const Text("Log in"),
                ),
              ),

              Flexible(
                child: Container(),
                flex: 2,
              ),

              // Transitioning to signing up
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Row(
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
                      onTap: () {},
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
