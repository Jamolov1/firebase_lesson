import 'package:url_launcher/url_launcher.dart';

class UrlService {
  static Future<void> makePhoneCAll(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: "tel", path: phoneNumber);
    await launchUrl(launchUri);
  }

  static Future<void> launchInBrother(Uri url) async {
    if (await launchUrl(url, mode: LaunchMode.externalApplication)) {
    } else {
      print("xato");
    }
  }

  static Future TextMe() async {
    //Android
    const uri =
        'sms:+998918115632?body= hello';
    if (await canLaunch(uri)) {
      await launch(uri);
    }
  }
}