class Food{
  bool inStook;
  String name;
  String description;
  double price;
  String imagePath;
  double rating;
  bool isFav = false;
  bool inCart = false;
  int quantity = 1;

  Food({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.description,
    required this.inStook,
  });

  String get _name => name;
  double get _price => price;
  String get _imagePath => imagePath;
  double get _rating => rating;
  String get _description => imagePath;
  bool get _inStook => inStook;

}

