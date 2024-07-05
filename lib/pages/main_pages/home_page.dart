import 'package:flutter/material.dart';
import 'package:quick_bite/utils/helper_methods.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/Pizza and Sushi.png',
                    height: 75,
                  ),
                  Positioned(
                    right: 1,
                    child: Image.asset(
                      'assets/images/Pizza.png',
                      height: 75,
                    ),
                  ),
                  Center(
                    child: Text(
                      'The quickest way to find the perfect bite',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ),
                ],
              ),
            ),
            Theme(
              data: ThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(5.0),
                      outlineBorder: const BorderSide(style: BorderStyle.none),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none))),
              child: TextField(
                onChanged: (value) {},
                style: const TextStyle(color: Colors.blueGrey),
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.blueGrey,
                decoration: InputDecoration(
                  hintText: 'Search for a specific Restaurant',
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.blueGrey[900],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 0,
              ),
              child: title('How it works?'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  steps('assets/images/Step 1.png', 1,
                      'Enter your location.Type in your address, or pin your location by enabling location services'),
                  VerticalDivider(
                    thickness: 2,
                    color: Colors.blueGrey[900],
                  ),
                  steps('assets/images/Step 1.png', 2,
                      'Navigate through different restaurants with different food types and genres, where you can sort according different aspects'),
                  VerticalDivider(
                    thickness: 2,
                    color: Colors.blueGrey[900],
                  ),
                  steps('assets/images/Step 1.png', 3,
                      'Look through different types of dishes and discover which dishes are the most popular and delicious'),
                  VerticalDivider(
                    thickness: 2,
                    color: Colors.blueGrey[900],
                  ),
                  steps('assets/images/Step 1.png', 4,
                      'Satisfy your craving and enjoy your nice meal!'),
                  VerticalDivider(
                    thickness: 2,
                    color: Colors.blueGrey[900],
                  ),
                ],
              ),
            ),
            title('Work with QuickBite'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/Work with us.png'),
            ),
            Text(
              'As a rider',
              style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.6,
                child: Text(
                  'Earn money by delivering food from restaurants. All you need are the skills and a bike',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blueGrey[900],
                      ),
                ),
              ),
            ),
            TextButton(
              onPressed: (){},
              style: TextButton.styleFrom(
                  backgroundColor: Colors.amber[50],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(color: Color(0xFF263238))
                  )),
              child: Text(
                'Ride with us',
                style: TextStyle(color: Colors.blueGrey[900]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(color: Colors.blueGrey[900],thickness: 2,),
            ),
            Image.asset('assets/images/Partner.png'),
            Text(
              'As a Partner',
              style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.6,
                child: Text(
                  'QuickBite helps restaurants grow with online ordering loyalty programs, and more',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueGrey[900],
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: (){},
              style: TextButton.styleFrom(
                  backgroundColor: Colors.amber[50],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(color: Color(0xFF263238))
                  )),
              child: Text(
                'Partner with us',
                style: TextStyle(color: Colors.blueGrey[900]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(color: Colors.blueGrey[900],thickness: 2,),
            ),
            Image.asset('assets/images/Colleague.png'),
            Text(
              'As a Colleague',
              style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.6,
                child: Text(
                  'Be a part of a team that\'s building towards a top-notch deliver service' ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueGrey[900],
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: (){},
              style: TextButton.styleFrom(
                  backgroundColor: Colors.amber[50],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(color: Color(0xFF263238))
                  )),
              child: Text(
                'Work with us',
                style: TextStyle(color: Colors.blueGrey[900]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget steps(String imagePath, int stepNo, String description) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Image.asset(imagePath),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Step $stepNo',
              style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blueGrey[900],
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
