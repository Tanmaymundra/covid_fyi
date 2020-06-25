import 'package:covidfyi/Screens/FirstScreen.dart';
import 'package:covidfyi/Screens/SecondScreen.dart';
import 'package:covidfyi/Screens/ThirdScreen.dart';
import 'package:covidfyi/Screens/WelcomeScreen.dart';
import 'package:covidfyi/utilities/const_url.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
      ),
      home: FirstScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        FirstScreen.id: (context) => FirstScreen(),
        SecondScreen.id: (context) => SecondScreen(),
        ThirdScreen.id: (context) => ThirdScreen(),
      },
    );
  }
}
