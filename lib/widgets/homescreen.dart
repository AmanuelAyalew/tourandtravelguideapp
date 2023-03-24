import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tourandtravel/utils/constants.dart';
import 'package:tourandtravel/widgets/carouselSlider.dart';
import 'package:tourandtravel/widgets/hotelcard.dart';

import '../controllers/citycontroller.dart';
import '../screens/home and others/homepage.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);

  final CityController cityController = Get.put(CityController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              margin: const EdgeInsets.only(left: 10, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/onboarding1.jpg"),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hello lucy",
                            style:
                                TextStyle(color: Colors.black45, fontSize: 15),
                          ),
                          Text(
                            "Lets Find Best places",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed: () {},
                        child: const FaIcon(
                          FontAwesomeIcons.solidBell,
                          color: Colors.grey,
                        )),
                  ),
                ],
              ),
            ),
            Container(
                height: 80,
                width: Get.width,
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Center(
                  child: GestureDetector(
                    onTap: () => Get.toNamed("/SearchPlacesScreen"),
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          hintText: "Search places",
                          fillColor: Constants.Onbording_bacground_color,
                          contentPadding: const EdgeInsets.all(15),
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Constants.PRIM_COLOR),
                                onPressed: () {},
                                child: const Icon(
                                  Icons.menu_open,
                                  color: Colors.white,
                                )),
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Constants.Onbording_bacground_color),
                              borderRadius: BorderRadius.circular(10)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Constants.Onbording_bacground_color),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Constants.Onbording_bacground_color),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Constants.Onbording_bacground_color),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                )),
            const Padding(
              padding: EdgeInsets.only(left: 15, bottom: 15),
              child: Text(
                "Explore City",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Constants.PRIM_COLOR,
                          child: IconButton(
                            color: Colors.white,
                            icon: const Icon(FontAwesomeIcons.locationPin),
                            onPressed: () => Get.toNamed(
                                "/search"), //make the onpressed route to google geolocator ur location page and there show a nearby places
                          ),
                        ),
                        const Text(
                          "Nearby",
                          style: TextStyle(color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GetBuilder<CityController>(
                      init: Get.find<CityController>(),
                      initState: (_) {},
                      builder: (controller) {
                        if (controller.is_loaading.value) {
                          return Center(
                              child: const CircularProgressIndicator());
                        } else {
                          return SizedBox(
                            height: 100,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                  controller.cities.value.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: GestureDetector(
                                      onTap: () => Get
                                          .toNamed("/citydetail", arguments: {
                                        "id": controller.cities.value[index].id,
                                        "name":
                                            controller.cities.value[index].name,
                                        "image": controller
                                            .cities.value[index].image,
                                        "lat":
                                            controller.cities.value[index].lat,
                                        "long":
                                            controller.cities.value[index].long
                                      }),
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundImage:
                                                CachedNetworkImageProvider(
                                                    controller.cities
                                                        .value[index].image),
                                          ),
                                          Text(
                                              controller
                                                  .cities.value[index].name,
                                              style: TextStyle(
                                                  color: Colors.black54))
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          );
                        }
                      }),
                ),
              ],
            ),
            carousel_slider(),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Recommended for your next trip",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 320,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    9,
                    (index) => hotels_card(),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
