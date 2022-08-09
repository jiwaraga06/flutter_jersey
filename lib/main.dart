import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jersey/source/data/cubit/auth_cubit.dart';
import 'package:flutter_jersey/source/data/cubit/jersey_cubit.dart';
import 'package:flutter_jersey/source/data/cubit/liga_cubit.dart';
import 'package:flutter_jersey/source/data/cubit/wishlist_cubit.dart';
import 'package:flutter_jersey/source/data/network/network.dart';
import 'package:flutter_jersey/source/data/repository/repository.dart';
import 'package:flutter_jersey/source/router/router.dart';

void main() {
  runApp(MyApp(
    router: RouterNavigation(),
    myRepository: MyRepository(myNetwork: MyNetwork()),
  ));
}

class MyApp extends StatelessWidget {
  final RouterNavigation? router;
  final MyRepository? myRepository;
  const MyApp({Key? key, this.router, this.myRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<JerseyCubit>(
          create: (jerseyContext) => JerseyCubit(myRepository: myRepository),
        ),
        BlocProvider<AuthCubit>(
          create: (authContext) => AuthCubit(myRepository: myRepository),
        ),
        BlocProvider<WishlistCubit>(
          create: (wishlistContext) => WishlistCubit(myRepository: myRepository),
        ),
        BlocProvider<LigaCubit>(
          create: (ligaContext) => LigaCubit(myRepository: myRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Jersey',
        theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(primary: const Color(0xFF1F4690)),
        ),
        onGenerateRoute: router!.generateRoute,
      ),
    );
  }
}
