import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/custom_widgets/filter_modal_bottom_sheet.dart';
import 'package:quick_bite/custom_widgets/menuItem_search_view.dart';
import 'package:quick_bite/custom_widgets/restaurant_search_view.dart';
import 'package:quick_bite/models/menu_item.dart';
import 'package:quick_bite/models/restaurant.dart';
import 'package:quick_bite/provider/app_provider.dart';
import 'package:quick_bite/utils/helper_methods.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Theme(
            data: ThemeData(
                inputDecorationTheme: InputDecorationTheme(
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(5.0),
                    outlineBorder: const BorderSide(style: BorderStyle.none),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none))),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchController.text = value;
                });
              },
              style: const TextStyle(color: Colors.blueGrey),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.blueGrey,
              decoration: InputDecoration(
                  hintText: 'Search for restaurants or dish',
                  suffixIcon: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              SafeArea(child: StatefulBuilder(builder: (
                                  BuildContext context,
                                  void Function(void Function()) setState) {
                                return  const FilterModalBottomSheet();

                              },)));
                    },
                    icon: const Icon(Icons.filter_alt),
                  ),
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    color: Colors.grey,
                  )),
            ),
          ),
          title('Restaurants'),
          Consumer<AppProvider>(
              builder: (BuildContext context, AppProvider appProvider,
                  Widget? child) {
                List<Restaurant> results = appProvider.resultRestaurant(
                    appProvider.filterRestaurant(), searchController.text);
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: results.length,
                  itemBuilder: (context, index) =>
                      RestaurantSearchView(restaurant: results[index]),
                );
              }

          ),
          title('Dishes'),
          Consumer<AppProvider>(
              builder: (BuildContext context, AppProvider appProvider,
                  Widget? child) {
                List<MenuItem> results = appProvider.resultMenuItems(
                    appProvider.filterMenuItems(), searchController.text);
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: results.length,
                  itemBuilder: (context, index) =>
                      MenuItemSearchView(menuItem: results[index]),
                );
              }

          ),

        ],
      ),
    );
  }
}
