import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../view/add_screen.dart';
import '../view/cart_screen.dart';
import '../view/favorite_screen.dart';
import '../view/home_page.dart';
import '../view/news_screen.dart';

// items of bottomnavigationbar
List<BottomNavigationBarItem> bottomNavItems = [
  const BottomNavigationBarItem(
    icon: FaIcon(FontAwesomeIcons.shop),
    label: 'Home',
  ),
  const BottomNavigationBarItem(
    icon: FaIcon(FontAwesomeIcons.bell),
    label: 'News',
  ),
  const BottomNavigationBarItem(
    activeIcon: null,
    icon: Icon(null),
    label: '',
  ),
  const BottomNavigationBarItem(
    icon: FaIcon(FontAwesomeIcons.heart),
    label: 'Favorite',
  ),
  const BottomNavigationBarItem(
    icon: FaIcon(FontAwesomeIcons.wallet),
    label: 'Cart',
  ),
];

// whole screens
List<Widget> screens = [
  const HomePage(),
  const NewsScreen(),
  const EmptyScreen(),
  const FavoriteScreen(),
  CartScreen()
];
