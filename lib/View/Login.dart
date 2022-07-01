import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showImage("carrot"),
              showTitle("Loging"),
              showTexts("Enter your emails and passwords"),
              SizedBox(height: size.height * 0.05),
              showTexts("Email"),
              showTextField("Enter your email", email, false),
              SizedBox(height: size.height * 0.05),
              showTexts("Password"),
              showTextField("Enter your email", password, true),
              showButton("Log In", () => Get.to(() => const Register())),
              SizedBox(height: size.height * 0.01),
              accountText("Dont have an account? ", "Sign Up")
            ],
          ),
        ),
      ),
    );
  }

  Widget showImage(String imageName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(2),
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.14,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset(
                "assets/$imageName.png",
              ).image,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Widget showTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.quicksand(
            fontSize: 27,
            color: const Color.fromARGB(255, 24, 23, 37),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget showTexts(String text) {
    return Text(
      text,
      style: GoogleFonts.quicksand(
          fontSize: 16,
          color: Colors.black54,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.001),
    );
  }

  Widget showButton(String text, Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(1),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).primaryColor,
            ),
          ),
          child: Text(text,
              style: GoogleFonts.quicksand(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }

  Widget showTextField(
      String hintText, TextEditingController controller, bool isPassword) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      autocorrect: true,
      showCursor: true,
      cursorColor: Theme.of(context).primaryColor,
      keyboardType: TextInputType.emailAddress,
      focusNode: FocusNode(),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.quicksand(
          fontSize: 16,
          color: Colors.black45,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.001,
        ),
      ),
    );
  }

  Widget accountText(String text_1, String text_2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [showTexts(text_1), greenText(text_2)],
      ),
    );
  }

  Widget greenText(String text) {
    return Text(
      text,
      style: GoogleFonts.quicksand(
          fontSize: 16,
          color: Colors.green,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.001),
    );
  }
}
