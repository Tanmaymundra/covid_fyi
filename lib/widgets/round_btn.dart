import 'package:covidfyi/utilities/launch_services.dart';
import 'package:flutter/material.dart';

class round_btn extends StatelessWidget {
  final String btn_text;
  final IconData iconName;
  final String data;
  static Color inactivebtn = Colors.black12;
  static Color activebtn = Colors.blueGrey;

  round_btn({
    this.btn_text,
    this.iconName,
    this.data,
  });

  void onPressed(String btn_text) {
    if (btn_text == 'Call') {
      launching().call(data);
    } else if (btn_text == 'Email') {
      launching().sendEmail(data);
    } else {
      launching().openurl(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 35.0,
      child: GestureDetector(
        onTap: () {
          if (!((data == '') | (data == null))) {
            onPressed(btn_text);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: ((data == '') | (data == null)) ? inactivebtn : activebtn,
              style: BorderStyle.solid,
              width: 2.0,
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
                btn_text,
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
