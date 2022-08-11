import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1.2,
                  blurRadius: 1.2,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Icon(FontAwesomeIcons.bars, color: Colors.black)),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My",
                  style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w300),
                ),
                Text(
                  "Profile",
                  style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            radius: 60,
            child: Text("Gambar"),
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              const SizedBox(height: 8),
              Text("Nama"),
              const SizedBox(height: 8),
              Text("Email"),
              const SizedBox(height: 8),
              Text("Nohp"),
              const SizedBox(height: 8),
              Text("Alamat"),
            ],
          )
        ],
      ),
    );
  }
}
