import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wap/login_page.dart';
import 'package:wap/welcome_slider.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  AssetImage pic = AssetImage('assets/images/wap_logo.png');
  Future checkFirstSeen() async {
    // ignore: omit_local_variable_types
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: omit_local_variable_types
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      await Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      await prefs.setBool('seen', true);
      await Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => WelcomeSliderPage()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CircleAvatar(
                  backgroundColor: Colors.teal[200],
                  radius: 75,
                  backgroundImage: pic,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'CONNECTING TO THE APP',
                style: TextStyle(color: Colors.teal),
              )
            ])));
  }
}
