import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_authentication/Controller/ItemController.dart';

import '../../../Constants/constants.dart';

class Beverages extends StatefulWidget {
  const Beverages({Key? key}) : super(key: key);

  @override
  State<Beverages> createState() => _BeveragesState();
}

class _BeveragesState extends State<Beverages> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  final itemController = Get.put(ItemController());
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 600), //controll animation duration
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    animation = ColorTween(
      begin: Colors.grey,
      end: Colors.red,
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(children: [
            getBack(),
            productsGrid(),
          ]),
        ),
      ),
    ));
  }

  Widget getBack() {
    return InkWell(
      onTap: () => Get.back(),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: animation.value,
            ),
          ),
          Expanded(child: Container()),
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: const Icon(
              Icons.file_upload_outlined,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget productsGrid() {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = size.height * 0.26;
    final double itemWidth = size.width / 2;
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: itemController.beverages.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (itemWidth / itemHeight), crossAxisCount: 2),
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.26,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Stack(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: cardImage(itemController.beverages
                                .elementAt(index)
                                .imageUrl),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          cardTitle(
                              itemController.beverages.elementAt(index).title),
                          Row(
                            children: [
                              showTexts(
                                  "${itemController.beverages.elementAt(index).count}ml,"),
                              showTexts(" Price"),
                            ],
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          cardMoney(itemController.beverages
                              .elementAt(index)
                              .price
                              .toString())
                        ]),
                    Positioned(
                        top: 1,
                        left: 1,
                        child: Center(
                          child: InkWell(
                            onTap: () async {
                              await itemController.addFavorite(
                                  itemController.beverages
                                      .elementAt(index)
                                      .title,
                                  itemController.beverages
                                      .elementAt(index)
                                      .imageUrl,
                                  itemController.beverages
                                      .elementAt(index)
                                      .count,
                                  itemController.beverages
                                      .elementAt(index)
                                      .price);
                              Fluttertoast.showToast(
                                  msg: "Added to Favourites",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            },
                            child: Icon(
                              Icons.favorite_border,
                              color: animation.value,
                            ),
                          ),
                        )),
                    Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: primaryColor),
                          child: Center(
                            child: InkWell(
                              onTap: () async {
                                await itemController.addCarts(
                                    itemController.beverages
                                        .elementAt(index)
                                        .title,
                                    itemController.beverages
                                        .elementAt(index)
                                        .imageUrl,
                                    itemController.beverages
                                        .elementAt(index)
                                        .count,
                                    itemController.beverages
                                        .elementAt(index)
                                        .price);
                                Fluttertoast.showToast(
                                    msg: "Added to Cart",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget cardMoney(String text) {
    return Row(
      children: [
        const Icon(Icons.attach_money, color: Colors.black87, size: 25),
        Text(
          text,
          style: GoogleFonts.quicksand(
              fontSize: 22,
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

  Widget cardTitle(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.quicksand(
          fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold),
    );
  }

  Widget cardImage(String imageName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        padding: const EdgeInsets.all(2),
        height: MediaQuery.of(context).size.height * 0.079,
        width: MediaQuery.of(context).size.width * 0.2,
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
