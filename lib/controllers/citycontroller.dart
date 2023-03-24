import 'dart:convert';

import 'package:tourandtravel/model/getdata.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:tourandtravel/services/remote_services.dart';

import '../model/citymodel.dart';

class CityController extends GetxController {
  Rx<List<City>> cities = Rx<List<City>>([]);
  var is_loaading = false.obs;

  @override
  void onInit() {
    fetchCity();
    super.onInit();
  }

  void fetchCity() async {
    try {
      is_loaading.value = true;
      var res = await RemoteServices.fetchCities();
      if (res != null) {
        is_loaading.value = false;
        cities.value = cityFromJson(res.body);
        update();
        // print("from " + res.body);
      }
    } finally {
      is_loaading(false);
    }
  }
}
