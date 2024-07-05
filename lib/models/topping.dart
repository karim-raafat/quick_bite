import 'package:quick_bite/models/food_type.dart';

class Topping{
  String name;
  double price;
  FoodType type;
  bool isSelected=false;

  Topping({required this.name, required this.price, required this.type});
}