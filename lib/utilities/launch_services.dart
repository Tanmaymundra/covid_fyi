import 'package:url_launcher/url_launcher.dart';

class launching {
  void call(String number) => launch("tel:$number");

  void sendSms(String number) => launch("sms:$number");

  void sendEmail(String email) => launch("mailto:$email");

  void openurl(String source_link) => launch("$source_link");
}
