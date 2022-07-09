import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/cardModel.dart';
import '../View/Extras/ProductPages/Beverages.dart';
import '../View/Extras/ProductPages/Bread.dart';
import '../View/Extras/ProductPages/Dairy.dart';
import '../View/Extras/ProductPages/Fruits.dart';
import '../View/Extras/ProductPages/Meat.dart';
import '../View/Extras/ProductPages/Oil.dart';

class ItemController extends GetxController {
  var favourite = Colors.grey.obs;
  var isFavorite = false.obs;
  var itemCount = 0.obs;
  List<CardModel> groceries = [
    CardModel("Pepper", "5", "pepper", 14.66),
    CardModel("Bananas", "2", "bananas", 26.32),
    CardModel("Chicken", "21", "chicken", 10.41),
    CardModel("Red Meat", "12", "red_meat", 18.32),
    CardModel("Garlic", "13", "garlic", 17.96),
  ].obs;
  List<CardModel> best = [
    CardModel("Pepper", "8", "pepper", 4.66),
    CardModel("Garlic", "15", "garlic", 7.96),
    CardModel("Chicken", "11", "chicken", 14.41),
    CardModel("Red Meat", "22", "red_meat", 18.32),
    CardModel("Bananas", "6", "bananas", 6.32),
    CardModel("Pepper", "8", "pepper", 4.66),
    CardModel("Garlic", "15", "garlic", 7.96),
    CardModel("Chicken", "11", "chicken", 14.41),
    CardModel("Chicken", "11", "chicken", 14.41),
    CardModel("Red Meat", "22", "red_meat", 18.32),
    CardModel("Bananas", "6", "bananas", 6.32),
  ].obs;
  List<CardModel> exclusive = [
    CardModel("Organic Bananas", "6", "bananas", 4.66),
    CardModel("Red Apples", "5", "cou_4", 7.96),
    CardModel("Olive Oil", "10", "cou_5", 4.41),
    CardModel("Organic fruits", "20", "fruits", 8.32),
    CardModel("Meat", "16", "meat", 10.32),
  ].obs;
  List<BeverageModel> beverages = [
    BeverageModel("Diet Coke", "355", "b1", 1.99),
    BeverageModel("Sprite Can", "325", "b2", 1.50),
    BeverageModel("Apple Juice", "2000", "b3", 15.99),
    BeverageModel("Orange Juice", "2000", "b4", 15.99),
    BeverageModel("Coke can", "325", "b5", 4.99),
    BeverageModel("Pepsi can", "330", "b6", 4.99),
  ].obs;
  List<EggModel> eggs = [
    EggModel("Egg Chicken Red", "4", "egg1", 1.99),
    EggModel("Egg Chicken White", "egg2", "b2", 1.50),
    EggModel("Egg Pasta", "30", "egg3", 15.99),
    EggModel("Egg Noodles", "19", "egg4", 15.99),
    EggModel("Moyannais ", "32", "egg5", 4.99),
    EggModel("Egg Noodles", "330", "egg6", 4.99),
  ].obs;
  List<ProductModel> findProducts = [
    ProductModel("Fresh Fruits & Vegetable", "fruits",
        () => Get.to(() => const Fruits())),
    ProductModel("Cooking Oil & Ghee", "oil", () => Get.to(() => const Oil())),
    ProductModel("Meat & Fish", "meat", () => Get.to(() => const Meat())),
    ProductModel("Bakery & Snacks", "bread", () => Get.to(() => const Bread())),
    ProductModel("Dairy & Eggs", "dairy", () => Get.to(() => const Dairy())),
    ProductModel("Beverages", "drinks", () => Get.to(() => const Beverages())),
    ProductModel("Meat & Fish", "meat", () => Get.to(() => const Meat())),
    ProductModel("Bakery & Snacks", "bread", () => Get.to(() => const Bread())),
    ProductModel("Beverages", "drinks", () => Get.to(() => const Beverages())),
    ProductModel("Cooking Oil & Ghee", "oil", () => Get.to(() => const Oil())),
    ProductModel("Dairy & Eggs", "dairy", () => Get.to(() => const Dairy())),
    ProductModel("Bakery & Snacks", "bread", () => Get.to(() => const Bread())),
  ].obs;
  addItem() {
    itemCount++;
  }

  removeItem() {
    itemCount--;
  }
}
