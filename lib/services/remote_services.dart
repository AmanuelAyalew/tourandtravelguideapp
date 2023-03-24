import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:tourandtravel/model/getdata.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<http.Response?> fetchHotels() async {
    var response =
        await client.get(Uri.parse("http://10.161.82.132:8000/tour/hotel/"));

    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  static Future<http.Response?> fetchCities() async {
    var response =
        await client.get(Uri.parse("http://10.161.82.132:8000/tour/city"));

    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  static Future<http.Response?> fetchToursites() async {
    var response =
        await client.get(Uri.parse("http://10.161.82.132:8000/tour/toursite"));

    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  static Future<http.Response?> fetchPackages() async {
    var response =
        await client.get(Uri.parse("http://10.161.82.132:8000/tour/package/"));

    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }
}
