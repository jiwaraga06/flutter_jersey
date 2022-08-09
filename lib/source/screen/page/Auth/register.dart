import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jersey/source/data/cubit/auth_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controllerNama = TextEditingController();
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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF1F4690),
          ),
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            showDialog(
                context: context,
                builder: (BuildContext) {
                  return Center(child: CircularProgressIndicator());
                });
          }
          if (state is RegisterLoaded) {
            Navigator.of(context).pop();
          }
          if (state is RegisterMessage) {
            CoolAlert.show(
              context: context,
              type: CoolAlertType.info,
              title: state.message,
            );
          }
          if (state is RegisterMessageSuccess) {
            CoolAlert.show(
                context: context,
                type: CoolAlertType.success,
                title: state.message,
                onConfirmBtnTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                });
          }
          if (state is RegisterError) {
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
                    child: Center(child: Text("Silahkan Daftarkan diri", style: GoogleFonts.lato(fontSize: 23, fontWeight: FontWeight.w500))),
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
                    controller: controllerNama,
                    decoration: InputDecoration(
                      hintText: 'Nama Lengkap',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.account_circle),
                    ),
                  ),
                ),
                // ERROR NAMA
                error['name'] != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 10.0, top: 4.0),
                        child: Text(error['name'][0], style: TextStyle(color: Colors.red)),
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
                    controller: controllerEmail,
                    decoration: InputDecoration(hintText: 'Email', border: InputBorder.none, prefixIcon: Icon(Icons.email_outlined)),
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
                      ),
                    ),
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
                      BlocProvider.of<AuthCubit>(context).register(controllerNama.text, controllerEmail.text, controllerPassword.text);
                    },
                    style: ElevatedButton.styleFrom(),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
