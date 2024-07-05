import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/pages/main_page.dart';
import 'package:quick_bite/pages/post_order_pages/track_page.dart';
import 'package:quick_bite/provider/app_provider.dart';

class CompletePurchasePage extends StatelessWidget {
  static final String routeName = 'complete';

  const CompletePurchasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Image.asset('assets/images/Complete.png'),
                Text(
                    'Your Purchase have been successfully completed!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: TextButton(
                      onPressed: (){
                        Provider.of<AppProvider>(context,listen: false).returnHome();
                        context.goNamed(MainPage.routeName);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Color(0xFF263238)),
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                      child: Text(
                        'Return to Home',
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
                        context.goNamed(TrackPage.routeName);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueGrey[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                      child: const Text(
                        'Track your order',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
