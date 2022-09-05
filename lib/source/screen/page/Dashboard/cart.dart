import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jersey/source/data/cubit/pesanan_detail_cubit.dart';
import 'package:flutter_jersey/source/data/cubit/total_harga_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PesananDetailCubit>(context).getPesananDetail();
    BlocProvider.of<TotalHargaCubit>(context).totalHarga();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "My ",
                      style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "Cart",
                      style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                  BlocBuilder<TotalHargaCubit, TotalHargaState>(
                          builder: (context, state) {
                            if (state is TotalHargaLoaded == false) {
                              return Container();
                            }
                            var totalHarga = (state as TotalHargaLoaded).totalharga;
                            if (totalHarga!.isEmpty) {
                              return Container();
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total Harga", style: GoogleFonts.poppins(fontSize: 15)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      formatCurrency.format(totalHarga['total_harga']).toString(),
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    ElevatedButton(onPressed: () {}, child: Text("CheckOut Sekarang")),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
              ],
            ),
          ),
          BlocBuilder<PesananDetailCubit, PesananDetailState>(
            builder: (context, state) {
              if (state is PesananDetailLoaded == false) {
                return Center(
                  child: Text("Belum ada Pesanan"),
                );
              }
              var data = (state as PesananDetailLoaded).pesananDetail;
              if (data!.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var value = data[index];
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.0), boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 0.3,
                          spreadRadius: 0.3,
                          offset: Offset(0, 3),
                        ),
                      ]),
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    "http://192.168.101.25:8000/assets/jersey/${value['gambar']}",
                                    height: 50,
                                    width: 50,
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value['nama_product'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        formatCurrency.format(value['total_harga']).toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        FontAwesomeIcons.minus,
                                        size: 15,
                                      )),
                                  Text(
                                    value['jumlah_pesanan'].toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        FontAwesomeIcons.plus,
                                        size: 15,
                                      )),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          value['nama'] == null
                              ? Container()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Optional"),
                                    const Divider(color: Colors.grey, thickness: 2),
                                    Table(
                                      columnWidths: const {
                                        0: FixedColumnWidth(100),
                                        1: FixedColumnWidth(20),
                                        2: FixedColumnWidth(200),
                                      },
                                      children: [
                                        TableRow(children: [
                                          Text('Nama'),
                                          Text(':'),
                                          Text(value['nama']),
                                        ]),
                                        TableRow(children: [
                                          Text('Nameset'),
                                          Text(':'),
                                          Text(
                                            formatCurrency.format(value['nameset']).toString(),
                                          ),
                                        ]),
                                        TableRow(children: [
                                          Text('Nomor'),
                                          Text(':'),
                                          Text(value['nomor'].toString()),
                                        ]),
                                      ],
                                    ),
                                  ],
                                )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
