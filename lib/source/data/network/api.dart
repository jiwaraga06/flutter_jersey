String baseurl = "http://192.168.101.25:8000";

class Api {
  static login() {
    return '$baseurl/api/login';
  }

  static register() {
    return '$baseurl/api/register';
  }

  static liga() {
    return '$baseurl/api/getLiga';
  }

  static product() {
    return '$baseurl/api/getProduct';
  }

  static productDetail(id) {
    return '$baseurl/api/productDetail/$id';
  }

  static bestproduct() {
    return '$baseurl/api/bestProduct';
  }

  static getWishlist(id) {
    return '$baseurl/api/getWishlist/$id';
  }

  static addWishlist() {
    return '$baseurl/api/addWishlist';
  }

  static removeWishlist() {
    return '$baseurl/api/removeWihslist';
  }

  static getProfile(id) {
    return '$baseurl/api/getProfile/$id';
  }

  static getPesananDetail() {
    return '$baseurl/api/getPesananDetail';
  }

  static getTotalHarga() {
    return '$baseurl/api/getTotalHarga';
  }

  static masukanKeranjang() {
    return '$baseurl/api/masukanKeranjang';
  }
}
