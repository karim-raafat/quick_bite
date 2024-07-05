import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/custom_widgets/menuItem_cart_view.dart';
import 'package:quick_bite/pages/post_order_pages/complete_purchase_page.dart';
import 'package:quick_bite/provider/app_provider.dart';
import 'package:quick_bite/utils/helper_methods.dart';

import 'shopping_cart_page.dart';

class CheckoutPage extends StatefulWidget {
  static final String routeName = 'checkout';

  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
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
                  Icons.shopping_cart,
                  color: Colors.blueGrey[900],
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset('assets/images/Checkout.png'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Checkout',
                      style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              title('Deliver method and time'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.delivery_dining,
                              color: Colors.blueGrey[900],
                            ),
                          ),
                          Text(
                            'Deliver in 35 min to Home',
                            style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 23,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Your home address here',
                              style: TextStyle(
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blueGrey[900],
                  ),
                ],
              ),
              Divider(
                color: Colors.blueGrey[900],
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          'No Contact Delivery',
                          style: TextStyle(
                              color: Colors.blueGrey[900],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          'Leave the order in front of my door',
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blueGrey[900],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: title('Selected Items'),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: appProvider.shoppingCart.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MenuItemCartView(
                        menuItem: appProvider.shoppingCart.keys.elementAt(index),
                        quantity: appProvider.shoppingCart[
                            appProvider.shoppingCart.keys.elementAt(index)]),
                  );
                },
              ),
              title('+ Add more Items'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Payment Details',
                    style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              Divider(
                color: Colors.blueGrey[900],
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.payment,
                              color: Colors.blueGrey[900],
                            ),
                          ),
                          Text(
                            'Choose a payment method',
                            style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 23,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Credit card ending XXXX',
                              style: TextStyle(
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blueGrey[900],
                  ),
                ],
              ),
              Divider(
                color: Colors.blueGrey[900],
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.attach_money_outlined,
                              color: Colors.blueGrey[900],
                            ),
                          ),
                          Text(
                            'Tip the courier',
                            style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 23,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Optional tip for the courier',
                              style: TextStyle(
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blueGrey[900],
                  ),
                ],
              ),
              Divider(
                color: Colors.blueGrey[900],
                thickness: 2,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: TextButton(
                        onPressed: (){
                          context.goNamed(ShoppingCartPage.routeName);
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xFF263238)),
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                        child: Text(
                          'Shopping Cart',
                          style: TextStyle(color: Colors.blueGrey[900]),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: TextButton(
                        onPressed: (){
                          context.goNamed(CompletePurchasePage.routeName);
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blueGrey[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                        child: Text(
                          'Pay \$${appProvider.total}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
