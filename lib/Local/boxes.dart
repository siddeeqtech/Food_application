import 'package:hive/hive.dart';
import 'package:mongo_authentication/LocalModel/favouriteModel.dart';

import '../LocalModel/CartModel.dart';

class Boxes {
  static Box<Favourite> getFavourite() => Hive.box<Favourite>('favorite');
  static Box<Cart> getCart() => Hive.box<Cart>('cart');
}
