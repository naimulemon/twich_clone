import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twich_clone/provider/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context,);
    return Scaffold(
        body: Center(
            child: Text(userProvider.user.username),
        ),
    );
  }
}
