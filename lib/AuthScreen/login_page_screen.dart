import 'package:e_wallet/AuthScreen/sign_up_page_screen.dart';
import 'package:e_wallet/MainScreen/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE1E9E5),
        appBar: AppBar(
          title: Center(
              child: Column(
            children: [
              SizedBox(height: 5),
              Text("Login Page",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ],
          )),
          elevation: 0,
          backgroundColor: Color(0xffE1E9E5),
          brightness: Brightness.dark,
          textTheme: TextTheme(
            headline5: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://www.onestopaerosols.co.uk/img/colours/webp/ral-effect-7904-dark-grey.webp"
                  ),
              fit: BoxFit.cover,
            )),
            child: SingleChildScrollView(
          child: Center(
            child: ModalProgressHUD(
              inAsyncCall: showProgress,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 180.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      // aici memorezi in o variabila continutul casutei text(email)
                      // variabila = value
                    },
                    decoration: InputDecoration(
                        hintText: "Enter your Email",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)))),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      // aici memorezi in o variabila continutul casutei text(email)
                      // variabila = value
                    },
                    decoration: InputDecoration(
                        hintText: "Enter your Password",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)))),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      // navigator catre register page
                    },
                    child: Text(
                      "Are you new here? Sign Up",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(height: 15),
                  Material(
                    elevation: 5,
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(32.0),
                    child: MaterialButton(
                      onPressed: () async {
                        setState(() {
                          showProgress = true;
                        });
                        try {
                          // aici te loghezi cu un user
                          // vezi tutoriale si exemple pe net
                          // hint: firebase
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainScreen(),
                              ));
                          final newUser = " ";
                          if (newUser != null) {
                            Fluttertoast.showToast(
                                msg: "Login Successfull",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.blueAccent,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            setState(() {
                              showProgress = false;
                            });
                            // Navigator catre homepage daca te-ai autentificat
                          }
                        } catch (e) {}
                      },
                      minWidth: 200.0,
                      height: 25.0,
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                    ),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 60),
                        FacebookSignInButton(),
                        // aici deja faci autentificare cu fb
                        // cand apesi pe button
                        // poti face aici sau poti face functie
                      ]),
                  Center(
                    child: FlatButton(
                      color: Color(0xffE1E9E5),
                      // aici deja faci autentificare cu google
                      // cand apesi pe button
                      // poti face aici sau poti face functie
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.windowsreport.com%2Fwp-content%2Fuploads%2F2016%2F10%2FGoogle-icon.jpg&f=1&nofb=1"),
                          ),
                          SizedBox(width: 10),
                          Center(
                            child: Text("Login with Google"),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

    ),
    );
  }
}
