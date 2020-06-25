import 'package:covidfyi/utilities/const_url.dart';
import 'package:covidfyi/widgets/BottomNavigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidfyi/cards/state.dart';

class FirstScreen extends StatelessWidget {
  static const String id = '/firstScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Covid-FYI'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: Makebottom(),
        body: ListView.builder(
          itemCount: StateList.length,
          itemBuilder: (BuildContext context, index) {
            return State_tile(
              stateName: StateList[index],
            );
          },
        ));
  }
}
