import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourandtravel/screens/home%20and%20others/homepage.dart';
import 'package:tourandtravel/screens/signin%20and%20login/SignUp.dart';
import 'package:tourandtravel/screens/signin%20and%20login/reset_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    //var isLogin = false;

    // checkIfLogin() async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   var email = prefs.getString("email");
    //   print(email);
    //   email == null ? LoginPage() : Homepage();
    // }

    // @override
    // initState() {
    //   checkIfLogin();
    //   super.initState();
    // }

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("please enter your email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("please enter a valid email");
        }
        return null;
      },
      onSaved: (Value) {},
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("please enter valid password(min. 6 charater)");
        }
      },
      onSaved: (Value) {
        passwordController.text = Value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final loginButton = Material(
      // elevation: 5,
      borderRadius: BorderRadius.circular(20),
      child: ElevatedButton(
        onPressed: () async {
/////LOGIN
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString("email", "useremail@gmail.com");
          if (_formkey.currentState!.validate()) {
            String res = await AuthMethods().loginUser(
                email: emailController.text, password: passwordController.text);
            // signIn(emailController.text, passwordController.text);
            if (res == 'success') {
              Fluttertoast.showToast(msg: "login successful");
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Homepage()));
            } else {
              Fluttertoast.showToast(msg: res);
            }
          }
        },
        child: const Text(
          'login',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          // minWidth: MediaQuery.of(context).size.width,

          padding: EdgeInsets.fromLTRB(120, 15, 120, 15),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(),
                  const SizedBox(
                    height: 30,
                    
                    child: Text('Ethio T&T'   , style: TextStyle(
              fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
        ),),
                
                  SizedBox(height: 45),
                  emailField,
                  SizedBox(height: 20),
                  passwordField,
                  SizedBox(height: 8),
                  forgotpassword(context),
                  SizedBox(height: 0),
                  loginButton,
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("dont have an account"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => sinup()));
                        },
                        child: Text(
                          'sigup',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  // void signIn(String email, String password) async {
  //   if (_formkey.currentState!.validate()) {
  //     await _auth
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then((uid) => {
  //               Fluttertoast.showToast(msg: "login successful"),
  //               Navigator.of(context).pushReplacement(
  //                   MaterialPageRoute(builder: (context) => EneblaHome()))
  //             })
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e!.message);
  //     });
  //   }
  // }

  Widget forgotpassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 85,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "forgot password",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.left,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => reset_password()));
        },
      ),
    );
  }

  AuthMethods() {}
}
