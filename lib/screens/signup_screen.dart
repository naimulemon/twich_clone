import 'package:flutter/material.dart';
import 'package:twich_clone/resources/auth_mathood.dart';
import 'package:twich_clone/utils/routes/myroutes.dart';
import 'package:twich_clone/widgets/coustom_text_field.dart';
import 'package:twich_clone/widgets/custom_botton.dart';

import '../widgets/loading_indicator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();
  bool _isLoading = false;
  void signUpUser() async {
    bool res = await _authMethods.signUpUser(context, _emailcontroller.text,
        _passwordcontroller.text, _usernamecontroller.text);
    setState(() {
      _isLoading = true;
    });
    if (res == true) {
      Navigator.pushNamed(context, MyRoutes.homescreen);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _usernamecontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
        ),
        body: _isLoading
            ? const LodingIndicator()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      CoustomTextField(controller: _usernamecontroller),
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
                      CustomButton(text: "Sign Up", ontap: signUpUser),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
