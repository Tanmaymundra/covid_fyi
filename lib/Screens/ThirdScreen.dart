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
  final String Noiteration;

  ThirdScreen({this.stateName, this.infotype, this.Noiteration});

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool _spinner = false;
  int counter;

  Future<List<Helpline>> getData() async {
    List<Helpline> return_list = [];
    final String url =
        state_data_api + widget.stateName + '/' + widget.infotype;
    NetworkHelper networkHelper = NetworkHelper(url);

    var Urldata = await networkHelper.getData();
    var Urldata_extracted = Urldata['results'] as List;
    counter = Urldata_extracted.length;

    //setState(() {
    //print('Url Data $Urldata');
    //print('Extracted ->  $Urldata_extracted');
    //_helpline_list = helplineFromJson(Urldata_extracted);
    //_spinner = false;
    // });
    return_list =
        Urldata_extracted.map<Helpline>((json) => Helpline.fromJson(json))
            .toList();

    print("List Size: ${return_list.length}");
    setState(() {
      _spinner = false;
    });

    return return_list;

    //return result_list;
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
      bottomNavigationBar: makeBottom(),
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
                return helpline_card(
                  info_type: (helpline.description == "")
                      ? helpline.name
                      : helpline.description,
                  Area: helpline.area,
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
