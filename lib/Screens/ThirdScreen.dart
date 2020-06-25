import 'package:covidfyi/cards/helpline.dart';
import 'package:covidfyi/json_extract/helpline_json.dart';
import 'package:covidfyi/utilities/Network.dart';
import 'package:covidfyi/utilities/const_url.dart';
import 'package:covidfyi/widgets/BottomNavigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ThirdScreen extends StatefulWidget {
  final String stateName;
  final String infotype;
  final String noiteration;

  ThirdScreen({this.stateName, this.infotype, this.noiteration});

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool _spinner = false;
  int counter;

  Future<List<Helpline>> getData() async {
    List<Helpline> returnList = [];
    final String url =
        state_data_api + widget.stateName + '/' + widget.infotype;
    NetworkHelper networkHelper = NetworkHelper(url);

    var urldata = await networkHelper.getData();
    var urldataExtracted = urldata['results'] as List;
    counter = urldataExtracted.length;

    returnList = urldataExtracted
        .map<Helpline>((json) => Helpline.fromJson(json))
        .toList();

    //print("List Size: ${returnList.length}");
    setState(() {
      _spinner = false;
    });

    return returnList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _spinner = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.infotype),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: Makebottom(),
      body: ModalProgressHUD(
        inAsyncCall: _spinner,
        opacity: 0,
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            // if (snapshot.hasData) {
            return ListView.builder(
              itemCount: counter,
              itemBuilder: (BuildContext context, index) {
                Helpline helpline = snapshot.data[index];
                //print(snapshot.data.length);
                //print(helpline.description);
                //print(helpline.area);
                return Contact_card(
                  infotype: (helpline.description == "")
                      ? helpline.name
                      : helpline.description,
                  area: helpline.area,
                  number: helpline.phone1,
                  email: helpline.email1,
                  sourcelink: helpline.sourceurl,
                );
              },
            );
            //}
          },
        ),
      ),
    );
  }
}
