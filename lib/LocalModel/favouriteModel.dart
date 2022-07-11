import 'package:hive/hive.dart';
part 'favouriteModel.g.dart';

@HiveType(typeId: 1)
class Favourite extends HiveObject {
  @HiveField(0)
  late String image;

  @HiveField(1)
  late String count;

  @HiveField(2)
  late double price;

  @HiveField(3)
  late bool isCompleted = false;

  @HiveField(4)
  late String title;
}
