import 'package:url_launcher/url_launcher.dart';

abstract class Launcher {
  static void url(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    }
  }

  static void tel(String number) async {
    final uri = Uri(
      scheme: 'tel',
      path: number,
    );
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    }
  }

  static void sms(String number, String message) async {
    final uri = Uri(
      scheme: 'sms',
      path: number,
      queryParameters: <String, String>{
        'body': Uri.encodeComponent(message),
      },
    );
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    }
  }
}
