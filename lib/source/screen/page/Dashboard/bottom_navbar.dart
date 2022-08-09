import 'package:flutter/material.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/cart.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/favorite.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/home.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/product.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  List screen = [
    Home(),
    Favorite(),
    Product(),
    Cart(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: screen[_currentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 1.2,
                  spreadRadius: 2.2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: _updateIndex,
                items: const [
                  BottomNavigationBarItem(
                    label: "Home",
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: "Favorite",
                    icon: Icon(Icons.favorite_border),
                  ),
                  BottomNavigationBarItem(
                    label: "Shirt",
                    icon: Icon(FontAwesomeIcons.shirt),
                  ),
                  BottomNavigationBarItem(
                    label: "Cart",
                    icon: Icon(FontAwesomeIcons.cartShopping),
                  ),
                  BottomNavigationBarItem(
                    label: "Profile",
                    icon: Icon(FontAwesomeIcons.user),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
