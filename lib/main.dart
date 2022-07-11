import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'LocalModel/CartModel.dart';
import 'LocalModel/favouriteModel.dart';
import 'View/Welcome.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(CartAdapter());
  Hive.registerAdapter(FavouriteAdapter());
  await Hive.openBox<Favourite>('favorite');
  await Hive.openBox<Cart>('cart');
  runApp(GetMaterialApp(
    theme: ThemeData(
      primaryColor: const Color.fromARGB(255, 83, 117, 117),
    ),
    home: const Welcome(),
    debugShowCheckedModeBanner: false,
  ));
}
