import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class round_btn extends StatelessWidget {
  final String btn_text;
  final Function btnpress;
  final IconData iconName;
  final Color inactive;

  round_btn({this.btn_text, this.btnpress, this.iconName, this.inactive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 35.0,
      child: GestureDetector(
        onTap: btnpress,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueGrey,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                iconName,
                size: 14,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                (btn_text == null) ? 'Hello' : btn_text,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
