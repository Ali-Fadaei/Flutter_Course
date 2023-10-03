import 'package:persian_number_utility/persian_number_utility.dart';

abstract class Convertor {
  //
  static String textToToman(String text) {
    return '${text.seRagham()} تومان';
  }
}
