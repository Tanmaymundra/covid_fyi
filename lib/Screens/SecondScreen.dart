import 'package:covidfyi/cards/info_type_tile.dart';
import 'package:covidfyi/utilities/Network.dart';
import 'package:covidfyi/utilities/const_url.dart';
import 'package:covidfyi/widgets/BottomNavigator.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final String stateName;

  SecondScreen({this.stateName});

  static const String id = '/secondScreen';

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List valid_infotype = [];

  Future<bool> infotypevalid(String infotype) async {
    final url = state_data_api + widget.stateName + '/' + infotype;
    NetworkHelper networkHelper = NetworkHelper(url);
    var data = await networkHelper.getData();
    //print(data['results']);

    if (data == "{results: []}") {
      return false;
    } else
      return true;
  }

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < info_types.length; i++) {
      bool valid = await infotypevalid(info_types[i]);
      if (valid) {
        valid_infotype.add(info_types[i]);
      }
    }
    print(valid_infotype);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Types'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: makeBottom(),
      body: ListView.builder(
          itemCount: info_types.length,
          itemBuilder: (BuildContext context, index) {
            var indexName = info_types[index];
            //var v = infotypevalid(indexName);
            return info_type_tile(
              iconname: getIcon(indexName),
              infotype: indexName,
            );
          }),
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
    else if (title == 'Hospital')
      return Icons.local_hospital;
    else if (title == 'Government Contacts')
      return Icons.contacts;
    else if (title == 'Laboratories')
      return Icons.local_convenience_store;
    else if (title == 'Quarantine Facilities') return Icons.local_hotel;
  }
}
