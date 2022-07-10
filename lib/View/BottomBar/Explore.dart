import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_authentication/Controller/ItemController.dart';

import '../../Constants/constants.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final itemController = Get.put(ItemController());
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: showTitle("Find Products")),
              showSearch(),
              productsGrid()
            ],
          ),
        ),
      ),
    );
  }

  Widget showTitle(String text) {
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

  Widget productsGrid() {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: itemController.best.length,
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.6,
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
                              onTap: itemController.findProducts
                                  .elementAt(index)
                                  .page,
                              child: cardImage(itemController.findProducts
                                  .elementAt(index)
                                  .imageUrl),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Center(
                            child: bodyHeadings(itemController.findProducts
                                .elementAt(index)
                                .title),
                          )
                        ]),
                  ],
                ),
              ),
            ),
          );
        });
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

  Widget bodyHeadings(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.quicksand(
          fontSize: 18, color: Colors.black87, fontWeight: FontWeight.w600),
    );
  }

  Widget showSearch() {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
}
