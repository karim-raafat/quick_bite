import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/utils/helper_methods.dart';
import '../models/menu_item.dart';
import '../pages/main_pages/restaurant_pages/menuItem_page.dart';
import '../provider/app_provider.dart';

class SectionView extends StatelessWidget {
  MenuItem menuItem;

  SectionView({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Provider.of<AppProvider>(context,listen: false).chooseMenuItem(menuItem);
        context.goNamed(MenuItemPage.routeName);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                menuItemInfo(context, menuItem),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(menuItem.imagePath),
                          fit: BoxFit.cover)),
                ),
              ],

            ),

          ),
          Divider(
            color: Colors.blueGrey[900],
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
