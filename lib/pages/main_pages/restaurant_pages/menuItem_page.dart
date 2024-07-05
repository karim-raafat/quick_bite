import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/custom_widgets/toppings_view.dart';
import 'package:quick_bite/models/menu_item.dart';
import 'package:quick_bite/provider/app_provider.dart';

class MenuItemPage extends StatefulWidget {
  MenuItem menuItem;
  static final String routeName = 'menuItem';

  MenuItemPage({super.key, required this.menuItem});

  @override
  State<MenuItemPage> createState() => _MenuItemPageState();
}

class _MenuItemPageState extends State<MenuItemPage> {
  @override
  @override
  void initState() {
    super.initState();
    Provider.of<AppProvider>(context, listen: false).subtotal =
        widget.menuItem.price;
    Provider.of<AppProvider>(context, listen: false).quantity = 1;
    Provider.of<AppProvider>(context, listen: false).resetToppings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(widget.menuItem.imagePath),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    right: 8,
                    top: 5,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.blueGrey[900],
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.menuItem.name,
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        (widget.menuItem.isPopular)
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 5),
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
                            : const SizedBox(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Text(
                              widget.menuItem.description,
                              style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Text(
                              '\$${widget.menuItem.price}',
                              style: TextStyle(
                                  color: Colors.blueGrey[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.blueGrey[900],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Toppings',
                            style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Choose a topping(optional)',
                            style: TextStyle(
                              color: Colors.blueGrey[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ToppingsView(),
                    Divider(
                      thickness: 2,
                      color: Colors.blueGrey[900],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: TextStyle(
                              color: Colors.blueGrey[900],
                              fontWeight: FontWeight.bold),
                        ),
                        Consumer<AppProvider>(
                          builder: (BuildContext context,
                              AppProvider appProvider, Widget? child) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 25),
                              child: Text(
                                '\$${appProvider.subtotal}',
                                style: TextStyle(
                                    color: Colors.blueGrey[900],
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Provider.of<AppProvider>(context,
                                          listen: false)
                                      .removeQuantity(widget.menuItem.price);
                                },
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.blueGrey[900],
                                ),
                              ),
                              Consumer<AppProvider>(
                                builder: (BuildContext context,
                                    AppProvider appProvider, Widget? child) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${appProvider.quantity}',
                                      style: TextStyle(
                                          color: Colors.blueGrey[900],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                onPressed: () {
                                  Provider.of<AppProvider>(context,
                                          listen: false)
                                      .addQuantity(widget.menuItem.price);
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.blueGrey[900],
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: TextButton(
                              onPressed: () {
                                Provider.of<AppProvider>(context,listen: false).addToCart(widget.menuItem);
                                context.pop();
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.blueGrey[900],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  )),
                              child: const Text(
                                'Add to Order',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget button(BuildContext context, String text, Color textColor,
          Color buttonColor) =>
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.45,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
            child: Text(
              text,
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      );
}
