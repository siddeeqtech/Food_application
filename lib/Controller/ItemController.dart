import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/cardModel.dart';

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
  ].obs;
  List<CardModel> exclusive = [
    CardModel("Organic Bananas", "6", "bananas", 4.66),
    CardModel("Red Apples", "5", "cou_4", 7.96),
    CardModel("Olive Oil", "10", "cou_5", 4.41),
    CardModel("Organic fruits", "20", "fruits", 8.32),
    CardModel("Meat", "16", "meat", 10.32),
  ].obs;

  addItem() {
    itemCount++;
  }

  removeItem() {
    itemCount--;
  }
}
