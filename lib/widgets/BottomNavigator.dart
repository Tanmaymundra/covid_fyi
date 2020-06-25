import 'package:covidfyi/Screens/FirstScreen.dart';
import 'package:covidfyi/utilities/const_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Makebottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: 45.0,
        child: BottomAppBar(
          color: kPrimaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.home, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
