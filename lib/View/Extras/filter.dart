import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(children: []),
        ),
      ),
    ));
  }

  // Widget showFilters() {
  //   bool checkedValue = false;
  //   return Column(
  //     children: [
  //       GroupButton(
  //         spacing: 5,
  //         isRadio: false,
  //         direction: Axis.horizontal,
  //         onSelected: (index, isSelected) => print(
  //             '$index button is ${isSelected ? 'selected' : 'unselected'}'),
  //         buttons: [
  //           "Dart",
  //           "Kotlin",
  //           "Java",
  //           "Swift",
  //           "Objective-C",
  //           "Python",
  //           "JS"
  //         ],
  //         selectedButtons: [0, 1],
  //
  //         /// [List)
  //       ),
  //     ],
  //   );
  // }

  Widget showTexts(String text) {
    return Text(
      text,
      style: GoogleFonts.quicksand(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.001),
    );
  }
}
