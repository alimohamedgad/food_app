import 'package:flutter/material.dart';
import 'package:food_app/pretention/view/cart/cart_view.dart';
import 'package:food_app/pretention/view/home/home_view.dart';

import 'pretention/view/Favorite/favourite_view.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeView(),
    const CartView(),
    const FavoriteView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 15,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'طلباتي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'المفضله',
          ),
        ],
      ),
    );
  }
}
