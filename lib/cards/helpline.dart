import 'package:covidfyi/utilities/launch_services.dart';
import 'package:covidfyi/widgets/round_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class helpline_card extends StatelessWidget {
  final String info_type;
  final String Area;
  final String number;
  final String email;
  final String Source;

  helpline_card(
      {this.email, this.Area, this.info_type, this.number, this.Source});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 170,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          info_type,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Container(
                        height: 1.5,
                        color: Colors.white10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //cryptoAmount()
                          Row(
                            children: <Widget>[
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Area',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),

                          SizedBox(
                            width: 20,
                            height: 40,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(number),
                              SizedBox(
                                height: 5,
                              ),
                              Text(email),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          round_btn(
                            btn_text: 'Call',
                            iconName: Icons.phone,
                           // btnpress: ,
                          ),
                          round_btn(
                            btn_text: 'Email',
                            iconName: Icons.email,
                          ),
                          round_btn(
                            btn_text: 'Source',
                            iconName: Icons.link,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
