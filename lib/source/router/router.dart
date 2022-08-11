import 'package:flutter/material.dart';
import 'package:flutter_jersey/source/router/string.dart';
import 'package:flutter_jersey/source/screen/page/Auth/login.dart';
import 'package:flutter_jersey/source/screen/page/Auth/register.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/bottom_navbar.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/cart.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/favorite.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/home.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/product.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/product_detail.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/profile.dart';
import 'package:flutter_jersey/source/screen/splash.dart';

class RouterNavigation {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case LOGIN:
        return MaterialPageRoute(
          builder: (_) => Login(),
        );
      case REGISTER:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => Register(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeOutCubic;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      case DASHBOARD:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BottomNavBar(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeOutCubic;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      case HOME:
        return MaterialPageRoute(
          builder: (_) => Home(),
        );
      case FAVORITE:
        return MaterialPageRoute(
          builder: (context) => Favorite(),
        );
      case PRODUCT:
        return MaterialPageRoute(
          builder: (_) => Product(),
        );
      case CART:
        return MaterialPageRoute(
          builder: (_) => Cart(),
        );
      case PROFILE:
        return MaterialPageRoute(
          builder: (_) => Profile(),
        );
      case PRODUCT_DETAIL:
      var id = settings.arguments;
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => ProductDetail(id: id),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeOutCubic;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      default:
        return null;
    }
  }
}
