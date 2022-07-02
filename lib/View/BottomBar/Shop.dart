import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final controller = FloatingSearchBarController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          showImage("carrot"),
          cityTexts("Dhoka", "Banassre"),
          showSearch()
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
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
