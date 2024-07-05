import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/pages/main_pages/home_page.dart';
import 'package:quick_bite/pages/main_pages/profile_page.dart';
import 'package:quick_bite/pages/main_pages/restaurants_page.dart';
import 'package:quick_bite/pages/main_pages/search_page.dart';
import 'package:quick_bite/pages/post_order_pages/checkout_page.dart';
import 'package:quick_bite/pages/post_order_pages/shopping_cart_page.dart';
import 'package:quick_bite/provider/app_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static final String routeName = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Colors.amber[50],
      bottomNavigationBar: Theme(
        data: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.blueGrey[800])),
        child: BottomNavigationBar(
          backgroundColor: Colors.amber[50],
          type: BottomNavigationBarType.fixed,
          currentIndex: appProvider.selectedIndex,
          onTap: (value) {
            appProvider.changeState(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_outlined),
              label: 'Restaurants',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'QUICK \nBITE',
          style: TextStyle(
              color: Colors.blueGrey[900],
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.blueGrey[900],
                size: 15,
              ),
            ),
          )
        ],
      ),
      body: Consumer<AppProvider>(
        builder: (BuildContext context, AppProvider value, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: (appProvider.selectedIndex == 0)
                  ? const HomePage()
                  : (appProvider.selectedIndex == 1)
                      ? const RestaurantsPage()
                      : (appProvider.selectedIndex == 2)
                          ? const SearchPage()
                          : const ProfilePage(),
            ),
          );
        },
      ),
      persistentFooterButtons: (appProvider.shoppingCart.isNotEmpty)
          ? [
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
                              borderRadius: BorderRadius.circular(8.0),
                              side: const BorderSide(color: Color(0xFF263238))
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
                          context.goNamed(CheckoutPage.routeName);
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blueGrey[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ]
          : null,
    );
  }

  void goToShoppingCart(BuildContext context) {
    context.goNamed(ShoppingCartPage.routeName);
  }

  void goToCheckoutPage(BuildContext context) {
    context.goNamed(CheckoutPage.routeName);
  }

  Widget button(BuildContext context, String text, Color textColor,
          Color buttonColor, Function onPressed) =>
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.45,
          child: TextButton(
            onPressed: onPressed(),
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
