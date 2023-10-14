import 'package:persian_number_utility/persian_number_utility.dart';

abstract class Validator {
  //
  static bool emptyField(String? value) {
    return value?.isEmpty ?? false;
  }

  static bool nationalCode(String? code) {
    return code?.isValidIranianNationalCode() ?? false;
  }

  static bool mobileNumber(String? mobileNumber) {
    return mobileNumber?.isValidIranianMobileNumber() ?? false;
  }
}
