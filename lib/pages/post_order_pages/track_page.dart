import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/pages/main_page.dart';
import 'package:quick_bite/provider/app_provider.dart';

class TrackPage extends StatelessWidget {
  static final String routeName = 'track';

  const TrackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/Track.png'),
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                  top: 6,
                  right: 10,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Provider.of<AppProvider>(context,listen: false).returnHome();
                        context.goNamed(MainPage.routeName);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.blueGrey[900],
                        size: 15,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -40,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey[900],
                    radius: 40,
                    child: const Text(
                      '35 min',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 45,
                bottom: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order Status',
                    style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    'until delivered',
                    style: TextStyle(
                      color: Colors.blueGrey[900],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.blueGrey[900],
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: const VerticalDivider(
                        thickness: 2,
                        color: Colors.yellow,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.blueGrey[900],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 60,
                                  ),
                                  child: Text(
                                    'Almost There!',
                                    style: TextStyle(
                                        color: Colors.blueGrey[900],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Your home address here.',
                                        style: TextStyle(
                                            color: Colors.blueGrey[900]),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
                Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: const VerticalDivider(
                        thickness: 2,
                        color: Colors.grey,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8
                              ),
                              child: Container(
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '2',
                                      style: TextStyle(
                                          color: Colors.blueGrey[900],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 160,
                                    top: 8
                                  ),
                                  child: Text(
                                    'Done!',
                                    style: TextStyle(
                                        color: Colors.blueGrey[900],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Your order is ready and is being \ndelivered now.',
                                        style: TextStyle(
                                            color: Colors.blueGrey[900]),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
                Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: const VerticalDivider(
                        thickness: 2,
                        color: Colors.grey,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8
                              ),
                              child: Container(
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '3',
                                      style: TextStyle(
                                          color: Colors.blueGrey[900],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 120,
                                      top: 8
                                  ),
                                  child: Text(
                                    'Delivered!',
                                    style: TextStyle(
                                        color: Colors.blueGrey[900],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Your order has been delivered.',
                                        style: TextStyle(
                                            color: Colors.blueGrey[900]),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
          ],
        ),
      ),
    );
  }
}
