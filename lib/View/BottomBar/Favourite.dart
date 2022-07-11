import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import '../../Controller/ItemController.dart';
import '../../Local/boxes.dart';
import '../../LocalModel/favouriteModel.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final itemController = Get.put(ItemController());
  final Stream<QuerySnapshot> _detailStream =
      FirebaseFirestore.instance.collection('Favourite').snapshots();
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
    return ValueListenableBuilder<Box<Favourite>>(
      valueListenable: Boxes.getFavourite().listenable(),
      builder: (context, box, index) {
        final tasks = box.values.toList().cast<Favourite>();
        final unfinishedTasks = tasks.where((task) => !task.isCompleted);

        return ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: unfinishedTasks
              .map((favourite) => FavouriteCardWidget(
                    favourite: favourite,
                  ))
              .toList(),
        );
      },
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

class FavouriteCardWidget extends StatelessWidget {
  FavouriteCardWidget({
    Key? key,
    required this.favourite,
  }) : super(key: key);
  final Favourite favourite;

  final itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.height * 0.025),
      height: size.height * 0.14,
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
              showImage(favourite.image, context),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        showTitle(favourite.title),
                        Expanded(child: Container()),
                        cardMoney(favourite.price.toString())
                      ],
                    ),
                    Row(
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        showTexts("${favourite.count}pcs,"),
                        showTexts(" Priceg"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 1,
              right: 0,
              child: InkWell(
                onTap: () => deleteFavourite(favourite),
                child: Center(
                  child: Icon(
                    Icons.clear,
                    color: Colors.grey[600],
                    size: 18,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  void deleteFavourite(Favourite favourite) {
    favourite.delete();
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

  Widget showImage(String imageName, BuildContext context) {
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
}
