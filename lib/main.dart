import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twich_clone/provider/user_provider.dart';
import 'package:twich_clone/resources/auth_mathood.dart';
import 'package:twich_clone/screens/home_screen.dart';
import 'package:twich_clone/screens/login_screen.dart';
import 'package:twich_clone/screens/onbroding_screen.dart';
import 'package:twich_clone/screens/signup_screen.dart';
import 'package:twich_clone/utils/colors.dart';
import 'package:twich_clone/utils/routes/myroutes.dart';
import 'package:twich_clone/widgets/loading_indicator.dart';
import 'models/user.dart' as model;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twich Clone',
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: AppBarTheme.of(context).copyWith(
            backgroundColor: backgroundColor,
            elevation: 0,
            titleTextStyle: const TextStyle(
              color: primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(
            color: primaryColor,
          )),
      routes: {
        "/": (context) => FutureBuilder(
            future: AuthMethods()
                .getCurrentUSer(FirebaseAuth.instance.currentUser != null
                    ? FirebaseAuth.instance.currentUser!.uid
                    : null)
                .then((value) {
              if (value != null) {
                Provider.of<UserProvider>(context, listen: false)
                    .setUser(model.User.fromMap(value));
              }
              return value;
            }),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LodingIndicator();
              }
              if (snapshot.hasData) {
                return const HomeScreen();
              }
              return const OnboradingScreen();
            }),
        MyRoutes.onbordingscreen: (context) => const OnboradingScreen(),
        MyRoutes.login: (context) => const LoginScreen(),
        MyRoutes.signup: (context) => const SignUpScreen(),
        MyRoutes.homescreen: (context) => const HomeScreen(),
      },
    );
  }
}
