import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/custom_widgets/menuItem_cart_view.dart';
import 'package:quick_bite/models/menu_item.dart';
import 'package:quick_bite/pages/post_order_pages/checkout_page.dart';
import 'package:quick_bite/provider/app_provider.dart';

class ShoppingCartPage extends StatefulWidget {
  static final String routeName = 'shoppingCart';

  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shopping Cart',
                style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Divider(
                  color: Colors.blueGrey[900],
                  thickness: 2,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: appProvider.shoppingCart.length,
                itemBuilder: (context, index) {
                  MenuItem menuItem =
                      appProvider.shoppingCart.keys.elementAt(index);
                  int? quantity = appProvider.shoppingCart[
                      appProvider.shoppingCart.keys.elementAt(index)];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: MenuItemCartView(
                          menuItem: menuItem,
                          quantity: quantity,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quantity',
                            style: TextStyle(color: Colors.blueGrey[900]),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
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
                                        .removeQuantityCart(menuItem);
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
                                        '$quantity',
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
                                        .addQuantityCart(menuItem);
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
                        ],
                      ),
                      Divider(
                        color: Colors.blueGrey[900],
                        thickness: 1,
                      )
                    ],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Costs',
                          style: TextStyle(color: Colors.blueGrey[900]),
                        ),
                        Text(
                          '\$5.0',
                          style: TextStyle(color: Colors.blueGrey[900]),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${appProvider.total}',
                            style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                          onPressed: () {
                            context.goNamed(CheckoutPage.routeName);
                          },

                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            backgroundColor: Colors.blueGrey[900]
                          ),
                          child: const Text(
                            'Checkout',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
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
