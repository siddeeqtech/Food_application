import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Home.dart';
import 'Login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getBack(),
                showImage("carrot"),
                showTitle("Sign Up"),
                showTexts("Enter your credentials to continue"),
                SizedBox(height: size.height * 0.05),
                showTexts("Username"),
                showTextField("Enter your name", email, false),
                SizedBox(height: size.height * 0.05),
                showTexts("Email"),
                showTextField("Enter your email", email, false),
                SizedBox(height: size.height * 0.05),
                showTexts("Password"),
                showTextField("Enter your email", password, true),
                SizedBox(height: size.height * 0.02),
                rowText("By continuing you agree to our ", "Terms of Service",
                    () => Get.to(() => const Home())),
                rowText(
                    "and", " Privacy Policy", () => Get.to(() => const Home())),
                SizedBox(height: size.height * 0.01),
                showButton("Sign Up", () => Get.to(() => const Home())),
                SizedBox(height: size.height * 0.01),
                accountText("Already have an account? ", "Sign in")
              ],
            ),
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
          fontSize: 15,
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

  Widget greenText(String text) {
    return Text(
      text,
      style: GoogleFonts.quicksand(
          fontSize: 15,
          color: Colors.green,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.001),
    );
  }

  Widget rowText(String text_1, String text_2, Function() function) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          showTexts(text_1),
          InkWell(onTap: function, child: greenText(text_2))
        ],
      ),
    );
  }

  Widget accountText(String text_1, String text_2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          showTexts(text_1),
          InkWell(
              onTap: () => Get.to(() => const Login()),
              child: greenText(text_2))
        ],
      ),
    );
  }

  Widget getBack() {
    return InkWell(
      onTap: () => Get.back(),
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black54,
        ),
      ),
    );
  }
}
