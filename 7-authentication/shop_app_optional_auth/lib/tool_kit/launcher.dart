import 'package:url_launcher/url_launcher.dart';
import 'tool_kit.dart' as T;

abstract class Launcher {
  static Future<bool> url(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
      return true;
    }
    return false;
  }

  static Future<bool> tel(String number) async {
    final uri = Uri(
      scheme: 'tel',
      path: number,
    );
    if (T.Validator.mobileNumber(number) && await canLaunchUrl(uri)) {
      launchUrl(uri);
      return true;
    }
    return false;
  }

  static Future<bool> sms(String number, String message) async {
    final uri = Uri(
      scheme: 'sms',
      path: number,
      queryParameters: <String, String>{
        'body': Uri.encodeComponent(message),
      },
    );
    if (T.Validator.mobileNumber(number) && await canLaunchUrl(uri)) {
      launchUrl(uri);
      return true;
    }
    return false;
  }
}
