import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mongo_authentication/Controller/ItemController.dart';

import 'package:hive/hive.dart';
import '../../Constants/constants.dart';
import '../../Local/boxes.dart';
import '../../LocalModel/CartModel.dart';

class Carts extends StatefulWidget {
  const Carts({Key? key}) : super(key: key);

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  final itemController = Get.put(ItemController());
  final Stream<QuerySnapshot> _detailStream =
      FirebaseFirestore.instance.collection('Cart').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              introTitle("My Cart"),
              cartCard(),
              showButton("Add all to cart", () => null)
            ],
          ),
        ),
      ),
    );
  }

  Widget cartCard() {
    return ValueListenableBuilder<Box<Cart>>(
      valueListenable: Boxes.getCart().listenable(),
      builder: (context, box, _) {
        final tasks = box.values.toList().cast<Cart>();
        final unfinishedTasks = tasks.where((task) => !task.isCompleted);

        return ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: unfinishedTasks
              .map((cart) => CartCardWidget(cart: cart))
              .toList(),
        );
      },
    );
  }

  Widget introTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.quicksand(
            fontSize: 20,
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

class CartCardWidget extends StatelessWidget {
  CartCardWidget({Key? key, required this.cart}) : super(key: key);
  final Cart cart;
  final itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.height * 0.025),
      height: size.height * 0.18,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          showImage(cart.image, context),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cartTitle(cart.title, () => deleteCart(cart)),
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    showTexts("${cart.count}pcs,"),
                    showTexts(" Priceg"),
                  ],
                ),
                Row(
                  children: [
                    counter(context),
                    Expanded(child: Container()),
                    cardMoney(cart.price.toString())
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showImage(String imageName, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(2),
        height: MediaQuery.of(context).size.height * 0.09,
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

  Widget counter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              color: Colors.grey[700],
              size: 18,
            ),
            onPressed: () => itemController.removeItem(),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.035,
            width: MediaQuery.of(context).size.width * 0.08,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: Colors.black38,
                width: 1,
              ),
            ),
            child: Center(
              child: Obx(() {
                return Text(
                  "${itemController.itemCount.value}",
                  style: GoogleFonts.quicksand(
                      fontSize: 18,
                      color: Colors.black38,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.001),
                );
              }),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: primaryColor,
              size: 18,
            ),
            onPressed: () => itemController.addItem(),
          ),
        ],
      ),
    );
  }

  Widget cartTitle(String text, Function() function) {
    return Row(
      children: [
        showTitle(text),
        Expanded(child: Container()),
        InkWell(
          onTap: function,
          child: const Icon(
            Icons.clear,
            color: Colors.grey,
            size: 21,
          ),
        )
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

  void deleteCart(Cart cart) {
    cart.delete();
  }
}
