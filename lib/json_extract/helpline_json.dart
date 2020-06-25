// To parse this JSON data, do
//
//     final helpline = helplineFromJson(jsonString);

import 'dart:convert';

// ignore: camel_case_types
class Helpline_list {
  final List<Helpline> helpline;

  Helpline_list({
    this.helpline,
  });

  factory Helpline_list.fromJson(List<dynamic> parsedJson) {
    List<Helpline> helpline = new List<Helpline>();
    helpline = parsedJson.map((i) => Helpline.fromJson(i)).toList();

    return Helpline_list(helpline: helpline);
  }
}

List<Helpline> helplineFromJson(String str) =>
    List<Helpline>.from(json.decode(str).map((x) => Helpline.fromJson(x)));

String helplineToJson(List<Helpline> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Helpline {
  Helpline({
    this.area,
    this.category,
    this.description,
    this.id,
    this.masterdataverificationstatus,
    this.phone1,
    this.phone2,
    this.source,
    this.sourceLinkValid,
    this.sourceurl,
    this.state,
    this.subcategory,
    this.verifiedby,
    this.verifiedby2,
    this.zonalverificationstatus,
    this.address,
    this.email1,
    this.email2,
    this.name,
    this.pointofcontact,
    this.verificationstatus,
  });

  String area;
  String category;
  String description;
  String id;
  String masterdataverificationstatus;
  String phone1;
  String phone2;
  String source;
  bool sourceLinkValid;
  String sourceurl;
  String state;
  String subcategory;
  String verifiedby;
  String verifiedby2;
  String zonalverificationstatus;
  String address;
  String email1;
  String email2;
  String name;
  String pointofcontact;
  String verificationstatus;

  factory Helpline.fromJson(Map<String, dynamic> json) => Helpline(
        area: json["area"] == null ? null : json["area"],
        category: json["category"] == null ? null : json["category"],
        description: json["description"] == null ? null : json["description"],
        id: json["id"] == null ? null : json["id"],
        masterdataverificationstatus:
            json["masterdataverificationstatus"] == null
                ? null
                : json["masterdataverificationstatus"],
        phone1: json["phone1"] == null ? null : json["phone1"],
        phone2: json["phone2"] == null ? null : json["phone2"],
        source: json["source"] == null ? null : json["source"],
        sourceLinkValid: json["source_link_valid"] == null
            ? null
            : json["source_link_valid"],
        sourceurl: json["sourceurl"] == null ? null : json["sourceurl"],
        state: json["state"] == null ? null : json["state"],
        subcategory: json["subcategory"] == null ? null : json["subcategory"],
        verifiedby: json["verifiedby"] == null ? null : json["verifiedby"],
        verifiedby2: json["verifiedby_2"] == null ? null : json["verifiedby_2"],
        zonalverificationstatus: json["zonalverificationstatus"] == null
            ? null
            : json["zonalverificationstatus"],
        address: json["address"] == null ? null : json["address"],
        email1: json["email1"] == null ? null : json["email1"],
        email2: json["email2"] == null ? null : json["email2"],
        name: json["name"] == null ? null : json["name"],
        pointofcontact:
            json["pointofcontact"] == null ? null : json["pointofcontact"],
        verificationstatus: json["verificationstatus"] == null
            ? null
            : json["verificationstatus"],
      );

  Map<String, dynamic> toJson() => {
        "area": area == null ? null : area,
        "category": category == null ? null : category,
        "description": description == null ? null : description,
        "id": id == null ? null : id,
        "masterdataverificationstatus": masterdataverificationstatus == null
            ? null
            : masterdataverificationstatus,
        "phone1": phone1 == null ? null : phone1,
        "phone2": phone2 == null ? null : phone2,
        "source": source == null ? null : source,
        "source_link_valid": sourceLinkValid == null ? null : sourceLinkValid,
        "sourceurl": sourceurl == null ? null : sourceurl,
        "state": state == null ? null : state,
        "subcategory": subcategory == null ? null : subcategory,
        "verifiedby": verifiedby == null ? null : verifiedby,
        "verifiedby_2": verifiedby2 == null ? null : verifiedby2,
        "zonalverificationstatus":
            zonalverificationstatus == null ? null : zonalverificationstatus,
        "address": address == null ? null : address,
        "email1": email1 == null ? null : email1,
        "email2": email2 == null ? null : email2,
        "name": name == null ? null : name,
        "pointofcontact": pointofcontact == null ? null : pointofcontact,
        "verificationstatus":
            verificationstatus == null ? null : verificationstatus,
      };
}
