import 'package:flutter/material.dart';
import 'package:twich_clone/resources/auth_mathood.dart';
import 'package:twich_clone/screens/home_screen.dart';
import 'package:twich_clone/utils/routes/myroutes.dart';
import 'package:twich_clone/widgets/coustom_text_field.dart';

import '../widgets/custom_botton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();

  loginUser() async {
    bool res = await _authMethods.loginUser(
        context, _emailcontroller.text, _passwordcontroller.text);
    if (res) {
      Navigator.pushNamed(context, MyRoutes.homescreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
              child: Text(
                "Email",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CoustomTextField(controller: _emailcontroller),
            const SizedBox(
              height: 20,
              child: Text(
                "Username",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
              child: Text(
                "Password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CoustomTextField(controller: _passwordcontroller),
            CustomButton(text: "Log In", ontap: loginUser),
          ],
        ),
      )),
    );
  }
}
