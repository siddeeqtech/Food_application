import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_authentication/Controller/ItemController.dart';

import '../../Constants/constants.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  final itemController = Get.put(ItemController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              introTitle("My Favourite"),
              cartCard(),
              showButton("Add All to cart", () => null)
            ],
          ),
        ),
      ),
    );
  }

  Widget cartCard() {
    final size = MediaQuery.of(context).size;
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => Divider(
              color: Colors.grey[400],
            ),
        itemCount: 13,
        itemBuilder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.height * 0.025),
            height: size.height * 0.13,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              // boxShadow: const [
              //   BoxShadow(
              //     color: Colors.black12,
              //     offset: Offset(0, 10),
              //     blurRadius: 10,
              //   ),
              // ],
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    showImage("meat"),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          cartTitle("Organic Bananas", () => null),
                          Row(
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              showTexts("${4}pcs,"),
                              showTexts(" Priceg"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: primaryColor),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ))
              ],
            ),
          );
        });
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

  Widget showImage(String imageName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(2),
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.18,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(
              "assets/$imageName.jpg",
            ).image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget cartTitle(String text, Function() function) {
    return Row(
      children: [
        showTitle(text),
        Expanded(child: Container()),
        cardMoney(5.toString())
      ],
    );
  }

  Widget showTitle(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
          fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w500),
    );
  }

  Widget cardMoney(String text) {
    return Row(
      children: [
        const Icon(Icons.attach_money, color: Colors.black87, size: 18),
        Text(
          text,
          style: GoogleFonts.quicksand(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.001),
        ),
      ],
    );
  }

  Widget introTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.quicksand(
            fontSize: 25,
            color: const Color.fromARGB(255, 24, 23, 37),
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget showButton(String text, Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
}
