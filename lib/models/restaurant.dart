import 'food_type.dart';
import 'menu_item.dart';

class Restaurant {
  String name;
  String description;
  String imagePath;
  double deliverPrice;
  int rating;
  String deliveryTime;
  FoodType type;
  List<MenuItem> menu;

  Restaurant(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.deliverPrice,
      required this.rating,
      required this.deliveryTime,
      required this.type,
      required this.menu});
}
