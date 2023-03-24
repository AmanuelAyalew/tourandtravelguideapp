import 'package:get/get.dart';
import 'package:tourandtravel/model/onbordmodel.dart';

class OnbordingController extends GetxController {
  var intialpage = 0.obs;

  List<OnbordModel> onbordlist = [
    OnbordModel(
        "Best Apartment and Hotel Booking",
        "Travel further. Travel longer. Travel deeper.",
        "assets/onboarding1.jpg"),
    OnbordModel("Explore", "Making life the daring adventure you deserve",
        "assets/onboarding2.jpg"),
    OnbordModel("Affordable travel. Unforgettable experiences.",
        "Taking the struggle out of travel planning", "assets/onboarding3.jpg"),
  ];

  void updatepage(int value) {
    intialpage.value = value;
  }
}
