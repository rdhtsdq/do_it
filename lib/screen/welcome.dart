import 'package:flutter/material.dart';
import 'package:flutter_project/screen/home.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Do It !",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Image.asset('assets/welcome.png'),
            Text(
              "Welcome Users!",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: Text(
                "Take To Home!",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
