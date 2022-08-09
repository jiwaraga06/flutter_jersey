import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jersey/source/data/cubit/jersey_cubit.dart';
import 'package:flutter_jersey/source/router/string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool password = true;
  void showPassword() {
    setState(() {
      password = !password;
    });
  }

  var error = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<JerseyCubit, JerseyState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                });
          }
          if (state is LoginLoaded) {
            Navigator.of(context).pop();
          }
          if (state is LoginMessage) {
            CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              title: state.message,
            );
          }
          if (state is LoginMessageSuccess) {
            Navigator.pushReplacementNamed(context, DASHBOARD);
            // CoolAlert.show(
            //   context: context,
            //   type: CoolAlertType.success,
            //   title: state.message,
            // );
          }
          if (state is LoginError) {
            setState(() {
              error = state.error;
              print(error);
            });
          }
        },
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Center(child: Text("Welcome back", style: GoogleFonts.lato(fontSize: 23, fontWeight: FontWeight.w500))),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 1.3, spreadRadius: 1.3, offset: Offset(0, 3))]),
                  child: TextFormField(
                    controller: controllerEmail,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email_outlined),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
                // ERROR EMAIL
                error['email'] != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 10.0, top: 4.0),
                        child: Text(error['email'][0], style: TextStyle(color: Colors.red)),
                      )
                    : Container(),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 1.3, spreadRadius: 1.3, offset: Offset(0, 3))]),
                  child: TextFormField(
                    controller: controllerPassword,
                    obscureText: password,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        prefixIcon: Icon(FontAwesomeIcons.key, size: 16),
                        suffixIcon: InkWell(
                          onTap: showPassword,
                          child: password ? Icon(FontAwesomeIcons.lock) : Icon(FontAwesomeIcons.lockOpen),
                        )),
                  ),
                ),
                 // ERROR PASSWORD
                error['password'] != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 10.0, top: 4.0),
                        child: Text(error['password'][0], style: TextStyle(color: Colors.red)),
                      )
                    : Container(),
                const SizedBox(height: 50),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<JerseyCubit>(context).login(controllerEmail.text, controllerPassword.text, context);
                    },
                    style: ElevatedButton.styleFrom(),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum punya akun ?"),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(fontSize: 17, color: Color(0xFF1F4690)),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
