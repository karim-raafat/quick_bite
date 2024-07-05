import 'food_type.dart';

class MenuItem {
  String name;
  String description;
  String imagePath;
  double price;
  bool isPopular;
  FoodType type;

  MenuItem({required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.type,
    required this.isPopular});
}
