import 'package:covidfyi/Screens/ThirdScreen.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Info_type_tile extends StatelessWidget {
  final String infotype;
  final IconData iconname;
  final String nocontacts;
  final String stateName;

  Info_type_tile({
    this.infotype,
    this.iconname,
    this.nocontacts,
    this.stateName,
  });

  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Icon(
            iconname,
            color: Colors.white,
          ),
        ),
        title: Text(
          infotype,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "$nocontacts Contacts",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.white,
          size: 30.0,
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ThirdScreen(
              stateName: stateName,
              infotype: infotype,
              noiteration: nocontacts,
            ),
          ));
        });
  }
}
