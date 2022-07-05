import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

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
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          showImage("carrot"),
          cityTexts("Dhoka", "Banassre"),
          showSearch(),
        ],
      ),
    ));
  }

  Widget showImage(String imageName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
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
    return Center(
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
    );
  }

  Widget showSearch() {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 1, 25, 0),
      child: SizedBox(
        width: size.width,
        child: TextFormField(
          cursorWidth: 1,
          obscureText: false,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              // icon: Icon(Icons.mail,size:30,color: Colors.black),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              hoverColor: Colors.red,
              hintText: "Search Store",
              prefixIcon: const Icon(Icons.search),
              fillColor: Colors.grey[200]),
          controller: controller,
        ),
      ),
    );
  }
}
