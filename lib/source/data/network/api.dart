String baseurl = "http://192.168.101.25:8000";

class Api {
  static login() {
    return '$baseurl/api/login';
  }
  static register() {
    return '$baseurl/api/register';
  }
  static product(){
    return '$baseurl/api/getProduct';
  }
  static liga(){
    return '$baseurl/api/getLiga';
  }
  static bestproduct(){
    return '$baseurl/api/bestProduct';
  }
}
