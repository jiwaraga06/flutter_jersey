import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jersey/source/data/cubit/jersey_cubit.dart';
import 'package:flutter_jersey/source/data/cubit/wishlist_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Product extends StatefulWidget {
  Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final formatCurrency =  NumberFormat.simpleCurrency(locale: 'id_ID');
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<JerseyCubit>(context).getProduct();
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
      body: ListView(
        shrinkWrap: true,
        
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
                  "Products",
                  style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          BlocBuilder<JerseyCubit, JerseyState>(
            builder: (context, state) {
              if (state is ProductResult == false) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var product = (state as ProductResult).product;
              if (product!.isEmpty) {
                return Column(
                  children: const [
                    SizedBox(height: 20),
                    Text('No Product'),
                  ],
                );
              }
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: product.length,
                itemBuilder: (context, index) {
                  var data = product[index];
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
                        Stack(
                          children: [
                            Image.network(
                              "http://192.168.50.6:8000/assets/jersey/${data['gambar']}",
                              height: 120,
                              width: 120,
                            ),
                            Positioned(
                                right: 0.0,
                                top: 0.0,
                                child: InkWell(
                                    onTap: () {
                                      // jerseyCubit.addWishlist(data['id'], 1);
                                      BlocProvider.of<WishlistCubit>(context).addWishlist(data['id'], 0);
                                    },
                                    child: Icon(Icons.favorite, size: 17, color: Colors.black)))
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          data['nama'],
                          style: GoogleFonts.poppins(fontSize: 13),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          formatCurrency.format(data['harga']).toString() ,
                          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 2),
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(onPressed: () {}, child: Text("Detail")),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
