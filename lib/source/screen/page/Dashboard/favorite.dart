import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jersey/source/data/cubit/jersey_cubit.dart';
import 'package:flutter_jersey/source/data/cubit/wishlist_cubit.dart';
import 'package:flutter_jersey/source/data/network/network.dart';
import 'package:flutter_jersey/source/data/repository/repository.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorite extends StatefulWidget {
  Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext favoriteContext) {
    BlocProvider.of<WishlistCubit>(favoriteContext).getwishtlist();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: BlocConsumer<WishlistCubit, WishlistState>(
        listener: (wishlistListenerContext, state) {},
        builder: (wishlistBuilderContext, state) {
          if (state is WishlistLoaded == false) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var fav = (state as WishlistLoaded).wishlist;
          if (fav!.isEmpty) {
            return Center(
              child: Text('Wishlist Empty'),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1 / 1.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: fav.length,
            itemBuilder: (context, index) {
              var data = fav[index];
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
                          "http://192.168.101.25:8000/assets/jersey/${data['gambar']}",
                          height: 120,
                          width: 120,
                        ),
                        Positioned(
                            right: 0.0,
                            top: 0.0,
                            child: InkWell(
                                onTap: () {
                                  // jerseyCubit.addWishlist(data['id'], 1);
                                  // BlocProvider.of<WishlistCubit>(context).getwishtlist();
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
                      'Rp. ' + data['harga'].toString(),
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
      ),
    );
  }
}
