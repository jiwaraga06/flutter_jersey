import 'package:flutter_jersey/source/data/network/network.dart';

class MyRepository {
  final MyNetwork? myNetwork;

  MyRepository({this.myNetwork});

  Future login(email, password) async {
    var body = {
      'email': email,
      'password': password,
    };
    final json = await myNetwork!.login(body);
    return json;
  }

  Future register(nama, email, password) async {
    var body = {
      'name': nama,
      'email': email,
      'password': password,
    };
    final json = await myNetwork!.register(body);
    return json;
  }

  Future getProduct() async {
    final json = await myNetwork!.getProduct();
    return json;
  }

  Future getProductDetail(id) async {
    final json = await myNetwork!.getProductDetail(id);
    return json;
  }

  Future getBestProduct() async {
    final json = await myNetwork!.bestProduct();
    return json;
  }

  Future liga() async {
    final json = await myNetwork!.liga();
    return json;
  }

  Future addWishlist(id_product, user_id, is_favorite) async {
    var body = {
      "id_product": id_product.toString(),
      "user_id": user_id.toString(),
      "is_favorite": is_favorite.toString(),
    };
    final json = await myNetwork!.addWishlist(body);
    return json;
  }

  Future removeWishlist(id_product, user_id, is_favorite) async {
    var body = {
      "id_product": id_product.toString(),
      "user_id": user_id.toString(),
      "is_favorite": is_favorite.toString(),
    };
    final json = await myNetwork!.removeWishlist(body);
    return json;
  }

  Future getWishlist(id) async {
    final json = await myNetwork!.getWishlist(id);
    return json;
  }

  Future getProfile(id) async {
    final json = await myNetwork!.getProfile(id);
    return json;
  }

  Future totalHarga(id) async {
    final json = await myNetwork!.getTotalharga(id);
    return json;
  }

  Future getPesananDetail(id) async {
    final json = await myNetwork!.getPesananDetail(id);
    return json;
  }

  Future masukanKeranjang(product_id, jumlah_pesanan, user_id) async {
    var body = {
      "product_id": product_id.toString(),
      "jumlah_pesanan": jumlah_pesanan.toString(),
      "user_id": user_id.toString(),
      "nama": "",
      "nomor": "",
      "nameset": "",
    };
    final json = await myNetwork!.masukanKeranjang(body);
    return json;
  }
}
