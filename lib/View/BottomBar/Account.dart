import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/ItemController.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final itemController = Get.put(ItemController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: personalInformation()),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: introTitle("My Daski Account"),
              ),
              showDivider(),
              cardButton(Icons.badge, "Details", () => null),
              showDivider(),
              cardButton(Icons.shopping_cart_checkout, "Orders", () => null),
              showDivider(),
              cardButton(Icons.delivery_dining, "Delivery Address", () => null),
              showDivider(),
              cardButton(Icons.payments, "Payment Method", () => null),
              showDivider(),
              cardButton(
                  Icons.notifications_active, "Notifications", () => null),
              showDivider(),
              cardButton(Icons.info_outline_rounded, "About", () => null),
              showDivider(),
              cardButton(Icons.help_outline_sharp, "Help", () => null),
              showButton("Log Out", () => null)
            ],
          ),
        ),
      ),
    ));
  }

  Widget personalInformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          avatar(),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              introTitle("Emilio Kariuki"),
              showTexts("Emilio113kariuki@gmail.com")
            ],
          ),
        ],
      ),
    );
  }

  Widget cardButton(IconData iconName, String action, Function() function) {
    return InkWell(
      onTap: function,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Row(
          children: [
            Row(
              children: [
                Icon(
                  iconName,
                  size: 18,
                  color: Colors.black54,
                ),
                const SizedBox(width: 15),
                introTitle(action),
              ],
            ),
            Expanded(child: Container()),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }

  Widget introTitle(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.quicksand(
          fontSize: 18,
          color: const Color.fromARGB(255, 24, 23, 37),
          fontWeight: FontWeight.w600),
    );
  }

  Widget avatar() {
    return const CircleAvatar(
      radius: 30,
      backgroundImage: AssetImage('assets/profile.jpg'),
    );
  }

  Widget showTexts(String text) {
    return Text(
      text,
      style: GoogleFonts.quicksand(
          fontSize: 16,
          color: Colors.black38,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.001),
    );
  }

  Widget showDivider() {
    return Divider(
      color: Colors.grey[300],
      thickness: 1,
      height: 10,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                const Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 18,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                Text(text,
                    style: GoogleFonts.quicksand(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
