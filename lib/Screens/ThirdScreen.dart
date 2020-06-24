import 'package:covidfyi/cards/helpline.dart';
import 'package:covidfyi/widgets/BottomNavigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ThirdScreen extends StatefulWidget {
  final String stateName;
  final String infotype;

  ThirdScreen({this.stateName, this.infotype});

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool _spinner = false;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.infotype),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: makeBottom(),
        body: ModalProgressHUD(
          inAsyncCall: _spinner,
          opacity: 0,
          child: helpline_card(),
        ));
  }
}
