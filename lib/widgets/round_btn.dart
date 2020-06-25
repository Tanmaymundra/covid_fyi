import 'package:covidfyi/utilities/launch_services.dart';
import 'package:flutter/material.dart';

class Roundbtn extends StatelessWidget {
  final String btntext;
  final IconData iconName;
  final String data;
  static Color inactivebtn = Colors.black12;
  static Color activebtn = Colors.blueGrey;

  Roundbtn({
    this.btntext,
    this.iconName,
    this.data,
  });

  void onPressed(String btnText) {
    if (btnText == 'Call') {
      Launching().call(data);
    } else if (btnText == 'Email') {
      Launching().sendEmail(data);
    } else {
      Launching().openurl(data);
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
            onPressed(btntext);
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
                btntext,
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
