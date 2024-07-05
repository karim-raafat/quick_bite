import 'package:flutter/material.dart';
import 'package:quick_bite/models/menu_item.dart';
import 'package:quick_bite/utils/helper_methods.dart';

class MenuItemCartView extends StatelessWidget {
  MenuItem menuItem;
  int? quantity;

  MenuItemCartView({super.key, required this.menuItem, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          child: const VerticalDivider(
            color: Colors.yellow,
            thickness: 2,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${quantity}x',
                style: TextStyle(
                    color: Colors.blueGrey[900], fontWeight: FontWeight.bold),
              ),
            ),
            menuItemInfo(context, menuItem),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height*0.12,
          width: MediaQuery.of(context).size.width*0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(menuItem.imagePath),
              fit: BoxFit.cover
            )
          ),
        )
      ],
    );
  }
}
