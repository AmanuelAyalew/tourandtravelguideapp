import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
import 'package:tourandtravel/screens/splash%20and%20onbording/getstarted.dart';
import 'package:tourandtravel/utils/constants.dart';
import 'package:tourandtravel/widgets/homescreen.dart';
import 'package:tourandtravel/screens/signin%20and%20login/login_page.dart';
import 'package:tourandtravel/screens/signin%20and%20login/editprofile.dart';
import 'package:tourandtravel/screens/signin%20and%20login/reset_password.dart';
import 'package:tourandtravel/screens/signin%20and%20login/reset_password.dart';

import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import 'package:flutter/material.dart';
import 'package:tourandtravel/widgets/homescreen.dart';

import '../signin and login/changePassword.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({Key? key}) : super(key: key);

  static const routeName = "/accountSetting";
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        toolbarHeight: 70,
        elevation: 2,
        automaticallyImplyLeading: false,
        title: const Text(
          'Account Setting',
          // style: TextStyle(color: style.Style.primaryColor),
        ),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            titlePadding: const EdgeInsets.all(20),
            title: 'Account Setting',
            tiles: [
              SettingsTile(
                title: 'Home',
                subtitle: 'Go to Home',
                leading: const Icon(Icons.home),
                onPressed: (BuildContext context) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BackupSettings()));
                },
              ),
              SettingsTile(
                title: 'Profile Setting',
                subtitle: 'Change your account information',
                leading: const Icon(Icons.manage_accounts),
                onPressed: (BuildContext context) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BackupSettings()));
                },
              ),
              SettingsTile(
                title: 'Change Password',
                subtitle: 'Change your account Password',
                leading: const Icon(Icons.lock),
                onPressed: (BuildContext context) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BackupSettings()));
                },
              ),
              // SettingsTile(
              //   title: 'Payment Method',
              //   subtitle: 'Add your Account',
              //   leading: Icon(Icons.payment),
              //   onPressed: (BuildContext context) {
              //     Navigator.push(
              //         // context,
              //         // MaterialPageRoute(
              //         //     builder: (context) => Payment_method()));
              //   },
              // ),
              SettingsTile(
                title: 'Order History',
                subtitle: 'View Order History',
                leading: const Icon(Icons.fastfood),
                onPressed: (BuildContext context) {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Order()));
                },
              ),
              // SettingsTile(
              //   title: 'Location',
              //   subtitle: 'Add or Remove Location',
              //   leading: Icon(Icons.location_on),
              //   onPressed: (BuildContext context) {},
              // ),
            ],
          ),
          SettingsSection(
            titlePadding: const EdgeInsets.all(20),
            title: 'More',
            tiles: [
              SettingsTile(
                title: 'Contact Us',
                subtitle: 'Send us a direct email',
                leading: const Icon(Icons.email),
                onPressed: (BuildContext context) {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ContactUs()));
                },
              ),
              SettingsTile(
                title: 'Logout',
                leading: const Icon(Icons.logout),
                onPressed: (BuildContext context) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));

                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Login()));
                  //navigator
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
