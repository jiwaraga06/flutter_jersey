import 'package:flutter/material.dart';
import 'package:flutter_jersey/source/router/router.dart';

void main() {
  runApp(MyApp(
    router: RouterNavigation(),
  ));
}

class MyApp extends StatelessWidget {
  final RouterNavigation? router;
  const MyApp({Key? key, this.router}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Jersey',
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(primary: const Color(0xFF1F4690)),
      ),
      onGenerateRoute: router!.generateRoute,
    );
  }
}
