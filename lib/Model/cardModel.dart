class CardModel {
  String title;
  String count;
  String imageUrl;
  double price;

  CardModel(this.title, this.count, this.imageUrl, this.price);
}

class BeverageModel {
  String title;
  String count;
  String imageUrl;
  double price;

  BeverageModel(this.title, this.count, this.imageUrl, this.price);
}

class EggModel {
  String title;
  String count;
  String imageUrl;
  double price;

  EggModel(this.title, this.count, this.imageUrl, this.price);
}

class ProductModel {
  String title;
  String imageUrl;
  Function() page;

  ProductModel(this.title, this.imageUrl, this.page);
}
