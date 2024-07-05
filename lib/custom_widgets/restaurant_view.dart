import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/models/restaurant.dart';
import 'package:quick_bite/pages/main_pages/restaurant_pages/restaurant_menu_page.dart';
import 'package:quick_bite/provider/app_provider.dart';

import '../utils/helper_methods.dart';

class RestaurantView extends StatelessWidget {
  Restaurant restaurant;

  RestaurantView({
    super.key,
    required this.restaurant
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Provider.of<AppProvider>(context,listen: false).chooseRestaurant(restaurant);
          context.goNamed(RestaurantMenuPage.routeName);
        },
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      height: 100,
                      child: Image.asset(
                        restaurant.imagePath,
                        fit: BoxFit.cover,
                        width: 200,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 12,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          restaurant.deliveryTime,
                          style: const TextStyle(
                            color: Color(0xFF263238),
                            fontSize: 10,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 8
                ),
                child: restaurantInfo(restaurant),
              )
            ],
          ),
        ),
      ),
    );
  }


}
