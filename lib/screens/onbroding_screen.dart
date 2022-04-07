import 'package:flutter/material.dart';
import 'package:twich_clone/utils/routes/myroutes.dart';
import 'package:twich_clone/widgets/custom_botton.dart';

class OnboradingScreen extends StatelessWidget {
  const OnboradingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "welcome To \nTwich",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            CustomButton(
                text: "Login",
                ontap: () {
                  Navigator.pushNamed(context, MyRoutes.login);
                }),
            CustomButton(text: "Sign Up", ontap: () {
                 Navigator.pushNamed(context, MyRoutes.signup);
            }),
          ],
        ),
      ),
    );
  }
}
