import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Login.dart';
import 'Register.dart';

class Residence extends StatefulWidget {
  const Residence({Key? key}) : super(key: key);

  @override
  State<Residence> createState() => _ResidenceState();
}

class _ResidenceState extends State<Residence> {
  final formKey = new GlobalKey<FormState>();
  final controller = TextEditingController();

  String? _selectedCountry;
  String? _selectedArea;
  final List items = [
    "Kenya",
    "Uganda",
    "Tanzania",
    "Burundi",
    "Rwanda",
    "Togo",
    "Sudan",
    "Ethiopia",
    "Congo"
  ];
  final List areas = [
    "Nairobi",
    "Mombasa",
    "Nyeri",
    "Kisumu",
    "Nakuru",
    "Eldoret",
    "Nyahururu",
    "Thika"
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getBack(),
              const SizedBox(height: 15),
              showImage("location"),
              showText(),
              SizedBox(
                height: size.height * 0.15,
              ),
              countryDown("Select Your Country"),
              SizedBox(
                height: size.height * 0.05,
              ),
              areaDown("Select Your Area"),
              showButton("Submit", () => Get.to(() => const Login())),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBack() {
    return InkWell(
      onTap: () => Get.back(),
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget showImage(String imageName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$imageName.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Widget showText() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          showTitle("Select Your Location"),
          showDescription("Switch on your location to stay in tune with"),
          showDescription("what's happening in your area"),
        ],
      ),
    );
  }

  Widget showTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.quicksand(
            fontSize: 27,
            color: const Color.fromARGB(255, 24, 23, 37),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget showDescription(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.quicksand(
          fontSize: 16,
          color: Colors.black45,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.001),
    );
  }

  Widget showTexts(String text) {
    return Text(
      text,
      style: GoogleFonts.quicksand(
          fontSize: 16,
          color: Colors.black54,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.001),
    );
  }

  Widget countryDown(String hint) {
    FocusNode textFieldFocusNode = FocusNode();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Zone",
            style: GoogleFonts.quicksand(
                fontSize: 16,
                color: const Color.fromARGB(255, 24, 23, 37),
                fontWeight: FontWeight.w500,
                letterSpacing: 0.001),
          ),
          DropdownButton2(
            scrollbarAlwaysShow: true,
            dropdownMaxHeight: MediaQuery.of(context).size.height * 0.3,
            hint: showTexts(hint),
            buttonWidth: MediaQuery.of(context).size.width,
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: showTexts(item),
                    ))
                .toList(),
            value: _selectedCountry,
            onChanged: (value) =>
                setState(() => _selectedCountry = value as String),
          )
        ],
      ),
    );
  }

  Widget areaDown(String hint) {
    FocusNode textFieldFocusNode = FocusNode();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Zone",
            style: GoogleFonts.quicksand(
                fontSize: 16,
                color: const Color.fromARGB(255, 24, 23, 37),
                fontWeight: FontWeight.w500,
                letterSpacing: 0.001),
          ),
          DropdownButton2(
            scrollbarAlwaysShow: true,
            dropdownMaxHeight: MediaQuery.of(context).size.height * 0.3,
            hint: showTexts(hint),
            buttonWidth: MediaQuery.of(context).size.width,
            items: areas
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: showTexts(item),
                    ))
                .toList(),
            value: _selectedArea,
            onChanged: (value) =>
                setState(() => _selectedArea = value as String),
          )
        ],
      ),
    );
  }

  Widget showButton(String text, Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
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
