import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/models/restaurant.dart';
import 'package:quick_bite/pages/main_pages/restaurant_pages/restaurant_menu_page.dart';
import 'package:quick_bite/provider/app_provider.dart';
import 'package:quick_bite/utils/helper_methods.dart';

class RestaurantSearchView extends StatelessWidget {
  Restaurant restaurant;
  RestaurantSearchView({super.key,required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Provider.of<AppProvider>(context,listen: false).chooseRestaurant(restaurant);
            context.goNamed(RestaurantMenuPage.routeName);
          },
          child: Row(
            
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  height: MediaQuery.of(context).size.height*0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(restaurant.imagePath),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
              restaurantInfo(restaurant),
            ],
          ),
        ),
        Divider(thickness: 2,color: Colors.blueGrey[900],)
      ],
    );
  }
}
