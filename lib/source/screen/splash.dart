import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jersey/source/data/cubit/jersey_cubit.dart';
import 'package:flutter_jersey/source/router/string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<JerseyCubit>(context).splashAuth();
    return Scaffold(
        body: BlocListener<JerseyCubit, JerseyState>(
      listener: (context, state) {
        if(state is SplashLoaded){
            Navigator.pushReplacementNamed(context, LOGIN);
          }
      },
      child: const Center(
        child: CircularProgressIndicator(color: Color(0xFF1F4690)),
      ),
    ));
  }
}
