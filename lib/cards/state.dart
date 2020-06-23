import 'package:flutter/material.dart';

class state_tile extends StatelessWidget {
  final String stateName;
  state_tile({this.stateName});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
          border: new Border(
            right: new BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.location_city,
            color: Colors.white,
          ),
          iconSize: 30,
        ),
      ),
      title: Text(
        stateName,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.white,
        size: 30,
      ),
      onTap: () {
        //  Navigator.pushNamed(context, )
      },
    );
  }
}
