import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/models/menu_item.dart';
import 'package:quick_bite/pages/main_pages/restaurant_pages/menuItem_page.dart';
import 'package:quick_bite/provider/app_provider.dart';
import 'package:quick_bite/utils/helper_methods.dart';

class MenuItemSearchView extends StatelessWidget {
  MenuItem menuItem;
  MenuItemSearchView({super.key,required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Provider.of<AppProvider>(context,listen: false).chooseMenuItem(menuItem);
            context.goNamed(MenuItemPage.routeName);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  height: MediaQuery.of(context).size.height*0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(menuItem.imagePath),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
              menuItemInfo(context,menuItem),

            ],
          ),
        ),
        Divider(thickness: 2,color: Colors.blueGrey[900],)
      ],
    );
  }
}
