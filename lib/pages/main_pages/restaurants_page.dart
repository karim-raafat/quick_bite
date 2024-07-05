import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/custom_widgets/restaurant_view.dart';
import 'package:quick_bite/models/restaurant.dart';
import 'package:quick_bite/provider/app_provider.dart';
import 'package:quick_bite/utils/helper_methods.dart';

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({super.key});

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    List<Restaurant> freeDelivery = appProvider.freeDelivery();
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/Restaurant.png',height: 270,),
          ),
          title('New on QuickBite'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 210,
              child: ListView.builder(
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: appProvider.allRestaurants.length,
                itemBuilder: (context,index) => RestaurantView(restaurant: appProvider.allRestaurants[index]),
              ),
            ),
          ),
          title('Popular right now'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 210,
              child: ListView.builder(
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: appProvider.allRestaurants.length,
                itemBuilder: (context,index) => RestaurantView(restaurant: appProvider.allRestaurants[index]),
              ),
            ),
          ),
          title('Free Delivery'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 210,
              child: ListView.builder(
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: freeDelivery.length,
                itemBuilder: (context,index) => RestaurantView(restaurant: freeDelivery[index]),
              ),
            ),
          ),
      
      
      
        ],
      ),
    );
  }

}
