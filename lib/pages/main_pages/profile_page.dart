import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create an account or log in',
                style: TextStyle(
                  color: Color(0xFF263238),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Log in below or create \na new QuickBite account.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF263238),
                  fontSize: 16,
                ),
              ),
              button(
                  context, 'Continue with Google', Colors.black, Colors.white),
              button(
                  context, 'Continue with Apple', Colors.white, Colors.black),
              button(context, 'Continue with facebook', Colors.white,
                  Colors.blueAccent),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(

                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'or log in using email',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF263238)),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),


                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.75,
                  child: Theme(
                    data: ThemeData(
                        inputDecorationTheme: InputDecorationTheme(
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.all(5.0),
                            outlineBorder: const BorderSide(
                                style: BorderStyle.none
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none
                            )
                        )
                    ),
                    child: const TextField(
                      style: TextStyle(color: Colors.blueGrey),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.blueGrey,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email, color: Colors.grey,)
                      ),
                    ),
                  ),
                ),
              ),
              button(context, 'Next', Colors.white, Colors.indigo[900]!)
            ],
          ),
        ],
      );

  }

  Widget button(BuildContext context, String text, Color textColor,
      Color buttonColor) =>
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.75,
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
