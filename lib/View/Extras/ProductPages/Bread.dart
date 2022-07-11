import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/constants.dart';
import '../../../Controller/ItemController.dart';
import '../productDetails.dart';

class Bread extends StatefulWidget {
  const Bread({Key? key}) : super(key: key);

  @override
  State<Bread> createState() => _BreadState();
}

class _BreadState extends State<Bread> {
  final itemController = Get.put(ItemController());
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
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
              size: 18,
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
              size: 18,
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
        itemCount: itemController.best.length,
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
                            child: InkWell(
                              onTap: () => Get.to(() => ProductDetails(
                                    count: itemController.best
                                        .elementAt(index)
                                        .count,
                                    imageUrl: itemController.best
                                        .elementAt(index)
                                        .imageUrl,
                                    price: itemController.best
                                        .elementAt(index)
                                        .price,
                                    title: itemController.best
                                        .elementAt(index)
                                        .title,
                                  )),
                              child: Hero(
                                tag: itemController.best.elementAt(index).title,
                                child: cardImage(itemController.best
                                    .elementAt(index)
                                    .imageUrl),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          cardTitle(itemController.best.elementAt(index).title),
                          Row(
                            children: [
                              showTexts(
                                  "${itemController.best.elementAt(index).count}pcs,"),
                              showTexts(" Price"),
                            ],
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          cardMoney(itemController.best
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
                              color: Colors.grey[600],
                              size: 20,
                            ),
                          ),
                        )),
                    Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.045,
                          width: MediaQuery.of(context).size.width * 0.1,
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
                                size: 18,
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
