import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jersey/source/data/cubit/detail_jersey_cubit.dart';
import 'package:flutter_jersey/source/data/cubit/store_keranjang_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ProductDetail extends StatefulWidget {
  final dynamic? id;
  const ProductDetail({Key? key, this.id}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DetailJerseyCubit>(context).getProductDetail(widget.id);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
          title: Text("Detail Jersey", style: TextStyle(color: Colors.black)),
        ),
        body: BlocBuilder<DetailJerseyCubit, DetailJerseyState>(builder: (context, state) {
          if (state is ProductDetailResult == false) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = (state as ProductDetailResult).detailProduct;
          if (data!.isEmpty) {
            return Center(
              child: Text("Kosong"),
            );
          }
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  "http://192.168.101.25:8000/assets/jersey/${data['gambar']}",
                  height: 250,
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['nama'],
                      style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    Table(
                      columnWidths: {
                        0: FixedColumnWidth(100),
                        1: FixedColumnWidth(20),
                        2: FixedColumnWidth(200),
                      },
                      children: [
                        TableRow(children: [
                          Text("Ready", style: TextStyle(fontSize: 17)),
                          Text(":"),
                          data['is_ready'] == 1
                              ? Row(
                                  children: [
                                    Icon(FontAwesomeIcons.check, color: Colors.green[600]),
                                    Text("Ready"),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Icon(FontAwesomeIcons.close, color: Colors.red[700]),
                                    Text("Not Ready"),
                                  ],
                                )
                        ]),
                        TableRow(children: [
                          Text("Harga", style: TextStyle(fontSize: 17)),
                          Text(":"),
                          Text(formatCurrency.format(data['harga']).toString(), style: TextStyle(fontSize: 16))
                        ]),
                        TableRow(children: [
                          Text("Nameset", style: TextStyle(fontSize: 17)),
                          Text(":"),
                          Text(data['harga_nameset'].toString(), style: TextStyle(fontSize: 16))
                        ]),
                        TableRow(children: [
                          Text("Jenis", style: TextStyle(fontSize: 17)),
                          Text(":"),
                          Text(data['jenis'], style: TextStyle(fontSize: 16)),
                        ]),
                        TableRow(children: [
                          Text("Berat", style: TextStyle(fontSize: 17)),
                          Text(":"),
                          Text(data['berat'].toString(), style: TextStyle(fontSize: 16)),
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<StoreKeranjangCubit>(context).masukanKeranjang(data['id']);
                    },
                    child: Text("Masukan Keranjang"),
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
