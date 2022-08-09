import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jersey/source/data/cubit/jersey_cubit.dart';
import 'package:flutter_jersey/source/data/network/network.dart';
import 'package:flutter_jersey/source/data/repository/repository.dart';
import 'package:flutter_jersey/source/router/string.dart';
import 'package:flutter_jersey/source/screen/page/Auth/login.dart';
import 'package:flutter_jersey/source/screen/page/Auth/register.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/bottom_navbar.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/cart.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/favorite.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/home.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/product.dart';
import 'package:flutter_jersey/source/screen/page/Dashboard/profile.dart';
import 'package:flutter_jersey/source/screen/splash.dart';

class RouterNavigation {
  MyRepository? myRepository;

  RouterNavigation() {
    myRepository = MyRepository(myNetwork: MyNetwork());
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => JerseyCubit(
                    myRepository: myRepository,
                  ),
                  child: const SplashScreen(),
                ));
      case LOGIN:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => JerseyCubit(
                    myRepository: myRepository,
                  ),
                  child: Login(),
                ));
      case REGISTER:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => JerseyCubit(myRepository: myRepository),
            child: Register(),
          ),
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
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => JerseyCubit(myRepository: myRepository),
            child: BottomNavBar(),
          ),
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
      // case HOME:
      //   return MaterialPageRoute(
      //       builder: (_) => MultiBlocProvider(
      //             providers: [
      //               BlocProvider<JerseyCubit>(
      //                 create: (BuildContext context) => JerseyCubit(myRepository: myRepository),
      //               ),
      //               BlocProvider<LigaCubit>(
      //                 create: (BuildContext context) => LigaCubit(myRepository: myRepository),
      //               ),
      //             ],
      //             child: Home(),
      //           ));
      case HOME:
        return MaterialPageRoute(
          builder: (_) => Home(),
        );
      case FAVORITE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => JerseyCubit(
                    myRepository: myRepository,
                  ),
                  child: Favorite(),
                ));
      case PRODUCT:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => JerseyCubit(
                    myRepository: myRepository,
                  ),
                  child: Product(),
                ));
      case CART:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => JerseyCubit(
                    myRepository: myRepository,
                  ),
                  child: Cart(),
                ));
      case PROFILE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => JerseyCubit(
                    myRepository: myRepository,
                  ),
                  child: Profile(),
                ));
      default:
        return null;
    }
  }
}
