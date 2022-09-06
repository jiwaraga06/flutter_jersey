import 'package:flutter_jersey/source/data/network/api.dart';
import 'package:http/http.dart' as http;

class MyNetwork {
  Future login(body) async {
    try {
      var url = Uri.parse(Api.login());
      var response = await http.post(url,
          headers: {
            'Accept': 'application/json',
          },
          body: body);
      return response;
    } catch (e) {
      print('Error network login');
    }
  }

  Future register(body) async {
    try {
      var url = Uri.parse(Api.register());
      var response = await http.post(url,
          headers: {
            'Accept': 'application/json',
          },
          body: body);
      return response;
    } catch (e) {
      print('Error network register');
    }
  }

  Future getProduct() async {
    try {
      var url = Uri.parse(Api.product());
      var response = await http.get(url);
      return response;
    } catch (e) {
      print("Error network getProduct");
    }
  }

  Future getProductDetail(id) async {
    try {
      var url = Uri.parse(Api.productDetail(id));
      var response = await http.get(url);
      return response;
    } catch (e) {
      print("Error network getProductDetail");
    }
  }

  Future bestProduct() async {
    try {
      var url = Uri.parse(Api.bestproduct());
      var response = await http.get(url);
      return response;
    } catch (e) {
      print("Error network bestProduct");
    }
  }

  Future liga() async {
    try {
      var url = Uri.parse(Api.liga());
      var response = await http.get(url);
      return response;
    } catch (e) {
      print("Error network liga");
    }
  }

  Future addWishlist(body) async {
    try {
      var url = Uri.parse(Api.addWishlist());
      var response = await http.post(url, body: body);
      return response;
    } catch (e) {
      print("Error network addWishlist");
    }
  }

  Future removeWishlist(body) async {
    try {
      var url = Uri.parse(Api.removeWishlist());
      var response = await http.post(url, body: body);
      return response;
    } catch (e) {
      print("Error network removeWishlist");
    }
  }

  Future getWishlist(id) async {
    try {
      var url = Uri.parse(Api.getWishlist(id));
      var response = await http.get(url);
      return response;
    } catch (e) {
      print("Error network addWishlist");
    }
  }

  Future getProfile(id) async {
    try {
      var url = Uri.parse(Api.getProfile(id));
      var response = await http.get(url);
      return response;
    } catch (e) {
      print("Error network profile");
    }
  }

  Future getPesananDetail(id) async {
    try {
      var url = Uri.parse(Api.getPesananDetail());
      var response = await http.post(url, body: {
        "user_id": id,
      });
      return response;
    } catch (e) {
      print("Error network pesanan detail");
    }
  }

  Future getTotalharga(id) async {
    try {
      var url = Uri.parse(Api.getTotalHarga());
      var response = await http.post(url, body: {
        "user_id": id,
      });
      return response;
    } catch (e) {
      print("Error network total harga");
    }
  }

  Future masukanKeranjang(body) async {
    try {
      var url = Uri.parse(Api.masukanKeranjang());
      var response = await http.post(url,
          headers: {
            'Accept': 'application/json',
          },
          body: body);
      return response;
    } catch (e) {
      print("Error network masukan keranjang");
    }
  }
}
