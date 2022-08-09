import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jersey/source/data/cubit/jersey_cubit.dart';
import 'package:flutter_jersey/source/data/cubit/liga_cubit.dart';
import 'package:flutter_jersey/source/data/network/network.dart';
import 'package:flutter_jersey/source/data/repository/repository.dart';
// import 'package:flutter_jersey/source/data/cubit/liga_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final JerseyCubit jerseyCubit = JerseyCubit(myRepository: MyRepository(myNetwork: MyNetwork()));
  final LigaCubit ligaCubit = LigaCubit(myRepository: MyRepository(myNetwork: MyNetwork()));

  @override
  void initState() {
    super.initState();
    jerseyCubit.getBestProduct();
    ligaCubit.getLiga();
  }

  @override
  void dispose() {
    super.dispose();
    jerseyCubit.close();
    ligaCubit.close();
  }

  @override
  Widget build(BuildContext homeContext) {
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
                  "Our",
                  style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w300),
                ),
                Text(
                  "Best Products",
                  style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 120,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xFF1F4690), width: 1),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          FontAwesomeIcons.shirt,
                          size: 20,
                        ),
                      ),
                      Text("Jersey", style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                BlocBuilder<JerseyCubit, JerseyState>(
                  bloc: jerseyCubit,
                  builder: (context, state) {
                    if (state is BestProductResult == false) {
                      return Center();
                    }
                    var bp = (state as BestProductResult).bestproduct;
                    if (bp!.isEmpty) {
                      return Center(
                        child: Text("Kosong"),
                      );
                    }
                    return SizedBox(
                      height: 250,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: bp.length,
                        itemBuilder: (BuildContext context, int index) {
                          var data = bp[index];
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(8.0),
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2.3,
                                  blurRadius: 2.3,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  "http://192.168.101.25:8000/assets/jersey/${data['gambar']}",
                                  height: 120,
                                  width: 120,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  data['nama'],
                                  style: GoogleFonts.poppins(fontSize: 13),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Rp. ' + data['harga'].toString(),
                                  style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                Container(
                  width: 120,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xFF1F4690), width: 1),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          FontAwesomeIcons.layerGroup,
                          size: 20,
                        ),
                      ),
                      Text("Liga", style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                BlocBuilder<LigaCubit, LigaState>(
                  bloc: ligaCubit,
                  builder: (contexts, state) {
                    if (state is LigaLoaded == false) {
                      return Center();
                    }
                    var bp = (state as LigaLoaded).liga;
                    if (bp!.isEmpty) {
                      return Center(
                        child: Text("Kosong"),
                      );
                    }
                    return SizedBox(
                      height: 250,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: bp.length,
                        itemBuilder: (BuildContext context, int index) {
                          var data = bp[index];
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(8.0),
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2.3,
                                  blurRadius: 2.3,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  "http://192.168.101.25:8000/assets/liga/${data['gambar']}",
                                  height: 120,
                                  width: 120,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
