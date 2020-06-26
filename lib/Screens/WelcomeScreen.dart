import 'dart:async';

import 'package:covidfyi/Screens/FirstScreen.dart';
import 'package:covidfyi/utilities/const_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FirstScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                color: bgcolour,

                //child: CircleAvatar(
                //minRadius: 50,
                //background: Colors.white,
                child: Center(
                  child: SvgPicture.asset(
                    'images/logo.svg',
                    // color: Colors.white,
                    // matchTextDirection: true
                  ),
                ),
              ),
            ),
            Container(
              color: bgcolour,
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
