import 'package:covidfyi/cards/info_type_tile.dart';
import 'package:covidfyi/utilities/Network.dart';
import 'package:covidfyi/utilities/const_url.dart';
import 'package:covidfyi/widgets/BottomNavigator.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SecondScreen extends StatefulWidget {
  final String stateName;

  SecondScreen({this.stateName});

  static const String id = '/secondScreen';

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List _valid_infotype = [];
  var _List_contacts = new Map();
  bool _spinner = false;
  Future<bool> infotypevalid(String infotype) async {
    final url = state_data_api + widget.stateName + '/' + infotype;
    NetworkHelper networkHelper = NetworkHelper(url);
    var data = await networkHelper.getData();

    _List_contacts['$infotype'] = data['results'].length.toString();

    if (data['results'].length == 0) {
      return false;
    } else
      return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _spinner = true;
    });

    infovalidity();
  }

  void infovalidity() async {
    for (var i = 0; i < info_types.length; i++) {
      bool valid = await infotypevalid(info_types[i]);
      if (valid) {
        setState(() {
          _valid_infotype.add(info_types[i]);
        });
      }
    }
    setState(() {
      _spinner = false;
    });

    print(_valid_infotype);
    print(_List_contacts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.stateName),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: makeBottom(),
      body: ModalProgressHUD(
        inAsyncCall: _spinner,
        opacity: 0,
        child: ListView.builder(
            itemCount: _valid_infotype.length,
            itemBuilder: (BuildContext context, index) {
              var indexName = _valid_infotype[index];

              return info_type_tile(
                iconname: getIcon(indexName),
                infotype: indexName,
                NoContacts: _List_contacts[indexName],
                stateName: widget.stateName,
              );
            }),
      ),
    );
  }

  IconData getIcon(String title) {
    if (title == 'Helplines')
      return Icons.phone;
    else if (title == 'Quarantine centres')
      return Icons.local_convenience_store;
    else if (title == 'Grocery Store')
      return Icons.store;
    else if (title == 'Fever Clinics')
      return Icons.local_hospital;
    else if (title == 'Doctors')
      return Icons.person;
    else if ((title == 'Hospital') | (title == 'Hospitals'))
      return Icons.local_hospital;
    else if (title == 'Government Contacts')
      return Icons.contacts;
    else if (title == 'Laboratories')
      return Icons.local_convenience_store;
    else if (title == 'Quarantine Facilities') return Icons.local_hotel;
  }
}
