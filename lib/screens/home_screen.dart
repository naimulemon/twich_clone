import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twich_clone/provider/user_provider.dart';
import 'package:twich_clone/screens/favorite_screen.dart';
import 'package:twich_clone/screens/feed_screen.dart';
import 'package:twich_clone/screens/go_live_screen.dart';
import 'package:twich_clone/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 1;
  List<Widget> pages = [
    const FavoriteScreen(),
    const GoLiveScreen(),
    const FeedScreen(),
  ];
  onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(
      context,
    );
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: buttonColor,
          unselectedItemColor: primaryColor,
          backgroundColor: backgroundColor,
          onTap: onPageChange,
          currentIndex: _page,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Go Live"),
            BottomNavigationBarItem(
                icon: Icon(Icons.browse_gallery), label: "Browes"),
          ]),
      body: pages[_page],
    );
  }
}
