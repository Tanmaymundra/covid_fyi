import 'package:flutter/material.dart';

class info_type_tile extends StatelessWidget {
  final String infotype;
  final IconData iconname;

  info_type_tile({this.infotype, this.iconname});

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
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.white,
          size: 30.0,
        ),
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          // builder: (context) => StateList(stateslist, infotype, context),
          // ));
        });
  }
}
