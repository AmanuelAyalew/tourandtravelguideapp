import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tourandtravel/controllers/onbordingcontroler.dart';
import 'package:tourandtravel/model/onbordmodel.dart';
import 'package:tourandtravel/utils/constants.dart';
//import 'package:google_fonts/google_fonts.dart';

class Onbording extends StatelessWidget {
  Onbording({Key? key}) : super(key: key);

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Expanded(
            child: GetBuilder<OnbordingController>(
              init: Get.find<OnbordingController>(),
              initState: (_) {},
              builder: (onbordcontroller) {
                return PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller,
                    children: [
                      onbordscreen(
                          Get.find<OnbordingController>().onbordlist[0]),
                      onbordscreen(
                          Get.find<OnbordingController>().onbordlist[1]),
                      onbordscreen(
                          Get.find<OnbordingController>().onbordlist[2]),
                    ],
                    onPageChanged: (value) {
                      onbordcontroller.intialpage.value = value;
                    });
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(14),
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Row(
                      children: List.generate(
                          3,
                          (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                margin: const EdgeInsets.all(5),
                                width: Get.find<OnbordingController>()
                                            .intialpage
                                            .value ==
                                        index
                                    ? 30
                                    : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(10)),
                              )),
                    )),
                FloatingActionButton(
                    elevation: 10,
                    child: FaIcon(
                      FontAwesomeIcons.arrowRight,
                      color: Colors.white,
                    ),
                    backgroundColor: Constants.PRIM_COLOR,
                    onPressed: () {
                      var page =
                          Get.find<OnbordingController>().intialpage.value;
                      if (Get.find<OnbordingController>().intialpage.value ==
                          2) {
                        Get.offNamed("/getstarted");
                      } else {
                        controller.jumpToPage(page + 1);
                      }
                    })
              ],
            ),
          )
        ],
      ),
    );
  }

  Container onbordscreen(OnbordModel onbordModel) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(onbordModel.image_url),
            fit: BoxFit.cover,
            colorFilter:
                const ColorFilter.mode(Colors.black45, BlendMode.luminosity)),
      ),
      //  height: Get.height,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.all(25),
              child: const Text(
                "Ethio T&T",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Text(
                      onbordModel.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 100),
                    child: Text(
                      onbordModel.desc,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 243, 239, 239),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
