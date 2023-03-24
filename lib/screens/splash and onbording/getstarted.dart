import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tourandtravel/controllers/onbordingcontroler.dart';
import 'package:tourandtravel/screens/signin%20and%20login/signup.dart';
import 'package:tourandtravel/utils/constants.dart';

class Getstarted extends StatelessWidget {
  const Getstarted({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/getstarted.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                          Colors.black45, BlendMode.luminosity))),
            )),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Lets Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(15),
                              elevation: 10,
                              backgroundColor: Constants.PRIM_COLOR),
                          onPressed: () {
                             Navigator.push(context,
                              MaterialPageRoute(builder: (context) => sinup()));
                          },
                          child: const Text("Sign Up")),
                    ),
                  ),
                  const SizedBox(
                    height: 2
                  ),
                  InkWell(
                      onTap: () => Get.offNamed("/login"),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: const Text(
                          "Aleardy have an account? Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
