import 'package:flutter/material.dart';
import 'package:quick_bite/models/food_type.dart';
import 'package:quick_bite/models/menu_item.dart';
import 'package:quick_bite/models/restaurant.dart';

Widget title(String text) => Column(
  children: [
    const Divider(
      thickness: 2,
      color: Color(0xFF263238),
    ),
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF263238),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
    const Divider(
      thickness: 2,
      color: Color(0xFF263238),
    ),
  ],
);

String typeToString(FoodType type){
  switch (type){
    case FoodType.SANDWICH : return 'Sandwich';
    case FoodType.PASTA : return 'Pasta';
    case FoodType.STEAK : return 'Steak';
    case FoodType.PIZZA : return 'Pizza';
    case FoodType.SUSHI : return 'Sushi';
    case FoodType.CAFE : return 'Cafe';
    case FoodType.BUREGER : return 'Burger';
    case FoodType.DESSERTS : return 'Desserts';
    case FoodType.INDIAN : return 'Indian';
    case FoodType.JAPANESE : return 'Japanese';
    case FoodType.KEBAB : return 'Kebab';
    default : return 'Salad';
  }
}

FoodType stringToType(String type){
  switch (type){
    case 'Sandwich' : return FoodType.SANDWICH;
    case 'Pasta' : return FoodType.PASTA;
    case 'Steak' : return FoodType.STEAK;
    case 'Pizza' : return FoodType.PIZZA;
    case 'Sushi' : return FoodType.SUSHI;
    case 'Cafe' : return FoodType.CAFE;
    case 'Burger' : return FoodType.BUREGER;
    case 'Desserts' : return FoodType.DESSERTS;
    case 'Indian' : return FoodType.INDIAN;
    case 'Japanese' : return FoodType.JAPANESE;
    case 'Kebab' : return FoodType.KEBAB;
    default : return FoodType.SALAD;
  }
}

Widget reviewStar(bool isFilled) => Icon(
  (isFilled) ? Icons.star : Icons.star_border_outlined,
  color: Colors.yellow,
  size: 17,
);

Widget restaurantInfo(Restaurant restaurant) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        restaurant.name,
        style: const TextStyle(
            color: Color(0xFF263238), fontWeight: FontWeight.bold),
      ),
      Text(
        restaurant.description,
        style: const TextStyle(
          color: Color(0xFF263238),
          fontSize: 10,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                      right: 8
                  ),
                  child: Icon(
                    Icons.delivery_dining,
                    color: Color(0xFF263238),
                    size: 20,
                  ),
                ),
                Text(
                  (restaurant.deliverPrice == 0)? 'free delivery' : '\$${restaurant.deliverPrice}',
                  style: const TextStyle(
                      color: Color(0xFF263238),
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              reviewStar(restaurant.rating>=1),
              reviewStar(restaurant.rating>=2),
              reviewStar(restaurant.rating>=3),
              reviewStar(restaurant.rating>=4),
              reviewStar(restaurant.rating>=5),
            ],
          ),
        ],
      ),
    ],
  );
}
Widget menuItemInfo(BuildContext context,MenuItem menuItem){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              menuItem.name,
              style: const TextStyle(
                color: Color(0xFF263238),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              menuItem.description,
              overflow: TextOverflow.fade,
              maxLines: 3,
              softWrap: true,
              style: const TextStyle(
                color: Color(0xFF263238),
                fontSize: 12,
              ),
            ),
            Row(
              children: [
                Text(
                  '\$${menuItem.price}',
                  style: const TextStyle(
                      color: Color(0xFF263238),
                      fontWeight: FontWeight.bold),
                ),
                (menuItem.isPopular)
                    ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5
                      ),
                      child: Text(
                        'popular',
                        style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 12,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                    ),
                  ),
                )
                    : const SizedBox()
              ],
            ),
          ],
        ),
      ),

    ],
  );
}