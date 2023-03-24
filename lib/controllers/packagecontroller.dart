import 'dart:convert';

import 'package:tourandtravel/model/getdata.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:tourandtravel/services/remote_services.dart';
import '../model/packagemodel.dart';

class PackageController extends GetxController {
  Rx<List<Package>> packages = Rx<List<Package>>([]);
  var is_loaading = true.obs;

  @override
  void onInit() {
    fetchPackage();
    super.onInit();
  }

  void fetchPackage() async {
    try {
      is_loaading(true);
      var res = await RemoteServices.fetchPackages();
      if (res != null) {
        is_loaading(false);
        packages.value = packageFromJson(res.body);
        print(res.body);
        update();
      }
    } finally {
      is_loaading(false);
    }
  }
}
