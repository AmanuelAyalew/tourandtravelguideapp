import 'dart:convert';

import 'package:tourandtravel/model/getdata.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:tourandtravel/services/remote_services.dart';
import '../model/toursitemodel.dart';

class ToursiteControler extends GetxController {
  Rx<List<Toursite>> toursites = Rx<List<Toursite>>([]);
  var is_loaading = true.obs;

  @override
  void onInit() {
    fetchToursite();
    super.onInit();
  }

  void fetchToursite() async {
    try {
      is_loaading(true);
      var res = await RemoteServices.fetchToursites();
      if (res != null) {
        is_loaading(false);
        toursites.value = toursiteFromJson(res.body);
        print(res.body);
        update();
      }
    } finally {
      is_loaading(false);
    }
  }
}
