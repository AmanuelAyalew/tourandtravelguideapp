import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tourandtravel/bindings/appbinding.dart';
import 'package:tourandtravel/screens/home%20and%20others/booking.dart';
import 'package:tourandtravel/screens/home%20and%20others/chooserooms.dart';
import 'package:tourandtravel/screens/home%20and%20others/citydetail.dart';
import 'package:tourandtravel/screens/home%20and%20others/_detail_screen.dart';
import 'package:tourandtravel/screens/home%20and%20others/homepage.dart';
import 'package:tourandtravel/screens/home%20and%20others/hoteldetail.dart';
import 'package:tourandtravel/screens/home%20and%20others/paymentconfirmed.dart';
import 'package:tourandtravel/screens/home%20and%20others/paymentmethod.dart';
import 'package:tourandtravel/screens/home%20and%20others/search.dart';
import 'package:tourandtravel/screens/home%20and%20others/trips.dart';
import 'package:tourandtravel/screens/home%20and%20others/AccountSetting.dart';
import 'package:tourandtravel/screens/search_places_screen.dart';
import 'package:tourandtravel/screens/home_page.dart';
import 'package:tourandtravel/screens/signin%20and%20login/login_page.dart';
import 'package:tourandtravel/screens/signin%20and%20login/reset_password.dart';
import 'package:tourandtravel/screens/splash%20and%20onbording/getstarted.dart';
import 'package:tourandtravel/utils/constants.dart';
import 'package:tourandtravel/providers/search_places.dart';

import 'screens/signin and login/signup.dart';
import 'screens/splash and onbording/onbording.dart';
import 'package:tourandtravel/homeii.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your APPLICATION.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      title: 'Tour and Travel',
      theme: ThemeData(
        colorScheme:
            const ColorScheme.light().copyWith(primary: Constants.PRIM_COLOR),
      ),
      initialRoute: "/onbording",
      getPages: [
        GetPage(name: "/onbording", page: () => Onbording()),
        GetPage(name: "/getstarted", page: () => const Getstarted()),
        GetPage(name: "/login", page: () => Homepage()),
        GetPage(name: "/map", page: () => MapHomePage()),
        GetPage(name: "/signup", page: () => const sinup()),
        GetPage(name: "/resetpassword", page: () => const reset_password()),
        GetPage(name: "/homepage", page: () => Homepage()),
        GetPage(name: "/citydetail", page: () => CityDetail()),
        GetPage(name: "/_detail_screen", page: () => RecipeDetailScreen()),
        GetPage(name: "/chooserooms", page: () => const ChooseRooms()),
        GetPage(name: "/hoteldetail", page: () => HotelDetail()),
        GetPage(name: "/booking", page: () => const Booking()),
        GetPage(name: "/paymentmethod", page: () => const PaymentMethod()),
        GetPage(name: "/paymentconfirm", page: () => const PaymentConfirmed()),
        GetPage(name: "/search", page: () => const Seaarch()),
        // GetPage(name: "/trips", page: () => const Trips()),
        GetPage(name: "/accountSetting", page: () => const AccountSetting()),
        GetPage(
            name: "/SearchPlacesScreen ",
            page: () => const SearchPlacesScreen()),
        GetPage(name: "/Homeii", page: () => const Homeii()),
      ],
    );
  }
}
