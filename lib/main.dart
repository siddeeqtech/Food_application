import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'View/Welcome.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
      primaryColor: const Color.fromARGB(255, 83, 117, 117),
    ),
    home: const Welcome(),
    debugShowCheckedModeBanner: false,
  ));
}
