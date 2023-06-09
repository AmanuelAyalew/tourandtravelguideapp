import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tourandtravel/auth/login.dart';
import 'package:tourandtravel/screens/signin%20and%20login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourandtravel/screens/home%20and%20others/accountSetting.dart';

// import '../../enebla_user_home.dart';

class BackupSettings extends StatefulWidget {
  @override
  _BackupSettingsState createState() => _BackupSettingsState();
}

class _BackupSettingsState extends State<BackupSettings> {
  final _newpasswordController = TextEditingController();
  final _repeatpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _changePassword(String yourPassword) async {
    User? user = FirebaseAuth.instance.currentUser;

    user!.updatePassword(yourPassword).then((_) {
      print('update done');
    }).catchError((error) {
      print("Error " + error.toString());
    });
  }

  bool checkCurrentPasswordValid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ('backup_text'),
        ),
        elevation: 0,
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
                context,
                MaterialPageRoute(
                    builder: (context) => const AccountSetting()));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                    validator: (input) {
                      if (input!.length < 8) {
                        return 'Please Provide Minimum 8 Character';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "new_password",
                      labelStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    obscureText: true,
                    controller: _newpasswordController),
                Container(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'repeat_password',
                      labelStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    obscureText: true,
                    controller: _repeatpasswordController,
                    validator: (value) {
                      return _newpasswordController.text == value
                          ? null
                          : "Please validate your entered password";
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  // padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                  onPressed: () {
                    print('-==-=-=-=-=-=');
                    if (_formKey.currentState!.validate()) {
                      _changePassword(_newpasswordController.text);
                      print('inside');
                    }
                  },

                  style: ElevatedButton.styleFrom(),
                  child: const Text(('save_button'),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
