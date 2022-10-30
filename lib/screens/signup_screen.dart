import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resource/auth_methods.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';

import '../widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final TextEditingController userNameCtrl = TextEditingController();

  AuthMethods _authMethods = AuthMethods();

  Uint8List? _image;
  bool isLoading = false;

  void selectImage() async {
    //Use try catch later.
    Uint8List? image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });

    String res = await _authMethods.signUpUser(
        email: emailCtrl.text,
        password: passCtrl.text,
        username: userNameCtrl.text,
        file: _image!);

     setState(() {
      isLoading = false;
    });

    if (res != "success") {
      // Snackbar
      showSnackBar(res, context);
    } else {
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => ResponsiveLayout(
            webScreenLayout: const WebScreenLayout(), 
            mobileScreenLayout: MobileScreenLayout())
      ));
      // showSnackBar(res, context);
    }
    print(res);
 
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailCtrl.dispose();
    passCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: screenSize.width,
            height: screenSize.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 1,
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

                //TODO: To show our circular avatar selected file

                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                                "https://thumbs.dreamstime.com/b/default-profile-picture-avatar-photo-placeholder-vector-illustration-default-profile-picture-avatar-photo-placeholder-vector-189495158.jpg"),
                          ),
                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: IconButton(
                        onPressed: () {
                          selectImage();
                        },
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: 24,
                ),

                // User Name
                TextFieldInput(
                  hintText: 'Username',
                  textEditingController: userNameCtrl,
                  textInputType: TextInputType.text,
                ),

                const SizedBox(
                  height: 24,
                ),

                // Email
                TextFieldInput(
                  hintText: 'Email Address',
                  textEditingController: emailCtrl,
                  textInputType: TextInputType.emailAddress,
                ),

                const SizedBox(
                  height: 24,
                ),

                // Password
                TextFieldInput(
                  hintText: 'Password',
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
                    onPressed: signUpUser,
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Colors.grey,
                          ))
                        : Text("Register"),
                  ),
                ),

                Flexible(
                  flex: 1,
                  child: Container(),
                ),

                // Transitioning to Login screen
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => LoginScreen()
                      )
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 02),
                        child: const Text(
                          "Have an account?",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 02),
                          child: const Text(
                            "Login.",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Flexible(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
