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
}
