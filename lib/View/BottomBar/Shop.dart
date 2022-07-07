import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_authentication/Constants/constants.dart';

import '../../Model/cardModel.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  showImage("carrot"),
                  cityTexts("Dhokas", "Banassre"),
                  showSearch(),
                  bodySubheading("Exclusive Offer", "see all", () => null),
                  exclusiveListCard(),
                  bodySubheading("Best Selling", "see all", () => null),
                  bestListCard(),
                  bodySubheading("Groceries", "see all", () => null),
                  groceriesListCard()
                ],
              ),
            ),
          ),
        ));
  }

  Widget showImage(String imageName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(2),
        height: MediaQuery.of(context).size.height * 0.04,
        width: MediaQuery.of(context).size.width * 0.12,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(
              "assets/$imageName.png",
            ).image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget showTitle(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.quicksand(
          fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget cityTexts(String town, String city) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.black,
              size: 25,
            ),
            Text(
              "$town,",
              style: GoogleFonts.quicksand(
                  fontSize: 19,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.001),
            ),
            Text(
              city,
              style: GoogleFonts.quicksand(
                  fontSize: 19,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.001),
            ),
          ],
        ),
      ),
    );
  }

  Widget showSearch() {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 1, 5, 0),
      child: Center(
        child: SizedBox(
          width: size.width,
          child: TextFormField(
            cursorWidth: 1,
            obscureText: false,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                // icon: Icon(Icons.mail,size:30,color: Colors.black),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[500]),
                hoverColor: Colors.red,
                hintText: "Search Store",
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black87,
                ),
                fillColor: Colors.grey[100]),
            controller: controller,
          ),
        ),
      ),
    );
  }

  Widget showCard() {
    int count = 7;
    return Container(
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
                    child: cardImage("fruits"),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  cardTitle("Organic Bananas"),
                  Row(
                    children: [
                      showTexts("${count}pcs,"),
                      showTexts(" Priceg"),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.07,
                  ),
                  cardMoney("4.99")
                ]),
            Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.12,
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
      ),
    );
  }

  Widget exclusiveListCard() {
    List<CardModel> items = [
      CardModel("Organic Bananas", "6", "bananas", 4.66),
      CardModel("Red Apples", "5", "cou_4", 7.96),
      CardModel("Olive Oil", "10", "cou_5", 4.41),
      CardModel("Organic fruits", "20", "fruits", 8.32),
      CardModel("Meat", "16", "meat", 10.32),
    ];
    return SizedBox(
      width: MediaQuery.of(context).size.width * 2,
      height: MediaQuery.of(context).size.height * 0.26,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
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
                            child: cardImage(items.elementAt(index).imageUrl),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          cardTitle(items.elementAt(index).title),
                          Row(
                            children: [
                              showTexts("${items.elementAt(index).count}pcs,"),
                              showTexts(" Price"),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.07,
                          ),
                          cardMoney("${items.elementAt(index).price}")
                        ]),
                    Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.12,
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
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Padding(padding: EdgeInsets.symmetric(horizontal: 5));
          },
          itemCount: items.length),
    );
  }

  Widget bestListCard() {
    List<CardModel> items = [
      CardModel("Pepper", "8", "pepper", 4.66),
      CardModel("Garlic", "15", "garlic", 7.96),
      CardModel("Chicken", "11", "chicken", 14.41),
      CardModel("Red Meat", "22", "red_meat", 18.32),
      CardModel("Bananas", "6", "bananas", 6.32),
    ];
    return SizedBox(
      width: MediaQuery.of(context).size.width * 2,
      height: MediaQuery.of(context).size.height * 0.26,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
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
                            child: cardImage(items.elementAt(index).imageUrl),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          cardTitle(items.elementAt(index).title),
                          Row(
                            children: [
                              showTexts("${items.elementAt(index).count}pcs,"),
                              showTexts(" Price"),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.07,
                          ),
                          cardMoney("${items.elementAt(index).price}")
                        ]),
                    Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.12,
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
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Padding(padding: EdgeInsets.symmetric(horizontal: 5));
          },
          itemCount: items.length),
    );
  }

  Widget groceriesListCard() {
    List<CardModel> items = [
      CardModel("Pepper", "5", "pepper", 14.66),
      CardModel("Bananas", "2", "bananas", 26.32),
      CardModel("Chicken", "21", "chicken", 10.41),
      CardModel("Red Meat", "12", "red_meat", 18.32),
      CardModel("Garlic", "13", "garlic", 17.96),
    ];
    return SizedBox(
      width: MediaQuery.of(context).size.width * 2,
      height: MediaQuery.of(context).size.height * 0.26,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
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
                            child: cardImage(items.elementAt(index).imageUrl),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          cardTitle(items.elementAt(index).title),
                          Row(
                            children: [
                              showTexts("${items.elementAt(index).count}pcs,"),
                              showTexts(" Price"),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.07,
                          ),
                          cardMoney("${items.elementAt(index).price}")
                        ]),
                    Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.12,
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
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Padding(padding: EdgeInsets.symmetric(horizontal: 5));
          },
          itemCount: items.length),
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

  Widget bodySubheading(String text1, String text2, Function() function) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          bodyHeadings(text1),
          Expanded(child: Container()),
          greenText(text2, function)
        ],
      ),
    );
  }

  Widget bodyHeadings(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.quicksand(
          fontSize: 23, color: Colors.black87, fontWeight: FontWeight.w600),
    );
  }

  Widget greenText(String text, Function() function) {
    return TextButton(
      onPressed: function,
      child: Text(text,
          style: GoogleFonts.quicksand(
              fontSize: 16,
              color: Colors.green,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.001)),
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
