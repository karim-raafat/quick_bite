import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/custom_widgets/section_view.dart';
import 'package:quick_bite/models/food_type.dart';
import 'package:quick_bite/provider/app_provider.dart';
import 'package:quick_bite/utils/helper_methods.dart';

import '../../../models/restaurant.dart';

class RestaurantMenuPage extends StatefulWidget {
  static final String routeName = 'restaurant';
  Restaurant restaurant;

  RestaurantMenuPage({super.key, required this.restaurant});

  @override
  State<RestaurantMenuPage> createState() => _RestaurantMenuPageState();
}

class _RestaurantMenuPageState extends State<RestaurantMenuPage> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    List<FoodType> sections = appProvider.foodTypes(widget.restaurant);
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.blueGrey[900],
                size: 15,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.blueGrey[900],
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(widget.restaurant.imagePath),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sections.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    title(typeToString(sections[index])),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.restaurant.menu.length,
                      itemBuilder: (context, index1) => (sections[index] ==
                              widget.restaurant.menu[index1].type)
                          ? SectionView(
                              menuItem: widget.restaurant.menu[index1])
                          : const SizedBox(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
