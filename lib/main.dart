import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_bite/pages/main_page.dart';
import 'package:quick_bite/pages/main_pages/restaurant_pages/menuItem_page.dart';
import 'package:quick_bite/pages/main_pages/restaurant_pages/restaurant_menu_page.dart';
import 'package:quick_bite/pages/post_order_pages/checkout_page.dart';
import 'package:quick_bite/pages/post_order_pages/complete_purchase_page.dart';
import 'package:quick_bite/pages/post_order_pages/shopping_cart_page.dart';
import 'package:quick_bite/pages/post_order_pages/track_page.dart';
import 'package:quick_bite/provider/app_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: _route,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  final _route = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          path: MainPage.routeName,
          name: MainPage.routeName,
          builder: (context, state) => const MainPage(),
          routes: [
            GoRoute(
              path: RestaurantMenuPage.routeName,
              name: RestaurantMenuPage.routeName,
              builder: (context, state) => RestaurantMenuPage(
                  restaurant: Provider.of<AppProvider>(context).restaurant),
            ),
            GoRoute(
              path: MenuItemPage.routeName,
              name: MenuItemPage.routeName,
              builder: (context, state) => MenuItemPage(
                  menuItem: Provider.of<AppProvider>(context).menuItem),
            ),
            GoRoute(
              path: ShoppingCartPage.routeName,
              name: ShoppingCartPage.routeName,
              builder: (context, state) => const ShoppingCartPage(),
            ),
            GoRoute(
                path: CheckoutPage.routeName,
                name: CheckoutPage.routeName,
                builder: (context, state) => const CheckoutPage(),
                routes: [
                  GoRoute(
                      path: CompletePurchasePage.routeName,
                      name: CompletePurchasePage.routeName,
                      builder: (context, state) => const CompletePurchasePage(),
                      routes: [
                        GoRoute(
                          path: TrackPage.routeName,
                          name: TrackPage.routeName,
                          builder: (context,state) => const TrackPage(),
                        ),
                      ]),
                ]),
          ]),
    ],
  );
}
