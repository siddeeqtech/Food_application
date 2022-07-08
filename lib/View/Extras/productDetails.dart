import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_authentication/Constants/constants.dart';
import 'package:mongo_authentication/Controller/ItemController.dart';

class ProductDetails extends StatefulWidget {
  String title;
  String count;
  String imageUrl;
  double price;

  ProductDetails(
      {Key? key,
      required this.title,
      required this.count,
      required this.imageUrl,
      required this.price})
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String get title => widget.title;

  String get count => widget.count;

  String get imageUrl => widget.imageUrl;

  double get price => widget.price;

  final itemController = Get.put(ItemController());
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getBack(),
                  Center(child: productImage(imageUrl)),
                  productTitle(title),
                  showTexts(count),
                  productCounter(),
                  expansionPanel(
                      "Product Details",
                      """Hi there, I'm a drop-in replacement for Flutter's ExpansionTile.
                        Use me any time you think your app could benefit from being just a bit more Material.
                        These buttons control the next card down!""",
                      cardA),
                  expansionPanel(
                      "Nutrition",
                      """Hi there, I'm a drop-in replacement for Flutter's ExpansionTile.
                        Use me any time you think your app could benefit from being just a bit more Material.
                        These buttons control the next card down!""",
                      cardB),
                  review(),
                  showButton("Add to Basket", () {
                    itemController.itemCount.value = 0;
                  }),
                ],
              ),
            ),
          ),
        ));
  }

  Widget productImage(String imageName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        padding: const EdgeInsets.all(2),
        height: MediaQuery.of(context).size.height * 0.24,
        width: MediaQuery.of(context).size.width * 0.55,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(
              "assets/$imageName.jpg",
            ).image,
            fit: BoxFit.fill,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
    );
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

  Widget productTitle(String text) {
    Color favColor = Colors.grey;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                fontSize: 27,
                color: Colors.black87,
                fontWeight: FontWeight.w500),
          ),
          Expanded(child: Container()),
          IconButton(
              icon: Icon(Icons.favorite, color: favColor),
              onPressed: () {
                setState(() {
                  favColor = Colors.red;
                  itemController.isFavorite.value =
                      favColor == Colors.red ? true : false;
                  print(itemController.isFavorite.value);
                });
              }),
        ],
      ),
    );
  }

  Widget showTexts(String text) {
    return Row(
      children: [
        Text(
          "${text}pcs ",
          style: GoogleFonts.quicksand(
              fontSize: 18,
              color: Colors.black38,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.001),
        ),
        Text(
          "Price",
          style: GoogleFonts.quicksand(
              fontSize: 18,
              color: Colors.black38,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.001),
        ),
      ],
    );
  }

  Widget counter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              color: Colors.grey[300],
            ),
            onPressed: () => itemController.removeItem(),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.045,
            width: MediaQuery.of(context).size.width * 0.1,
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
            icon: Icon(Icons.add, color: primaryColor),
            onPressed: () => itemController.addItem(),
          ),
        ],
      ),
    );
  }

  Widget productCounter() {
    return Row(
      children: [
        counter(),
        Expanded(child: Container()),
        cardMoney(price.toString())
      ],
    );
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

  Widget expansionPanel(String text, String content, Key key) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ExpansionTileCard(
        expandedColor: Colors.white,
        baseColor: Colors.white,
        elevation: 0,
        key: key,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            showTitle(text),
          ],
        ),
        children: <Widget>[
          const Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                content,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
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

  Widget showText(String text) {
    return Text(
      text,
      style: GoogleFonts.quicksand(
          fontSize: 16,
          color: Colors.black54,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.001),
    );
  }

  Widget review() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 15),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              showTitle("Review"),
              Expanded(child: Container()),
              InkWell(
                onTap: () {
                  setState(() {
                    showReview(context);
                  });
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black38,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                Icons.star,
                color: Colors.yellow[600],
                size: 20,
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget showButton(String text, Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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

  Future showReview(BuildContext context) {
    final review = TextEditingController();
    return Get.bottomSheet(Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: MediaQuery.of(context).size.height * 0.475,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Please fill for the Review of the Application",
                style: GoogleFonts.quicksand(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                  size: 20,
                );
              }),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              maxLines: 8,
              controller: review,
              maxLength: 200,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Write your review",
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            showButton("Submit", () {
              Get.back();
            }),
          ],
        ),
      ),
    ));
  }
}
