import 'package:persian_number_utility/persian_number_utility.dart';

abstract class Validators {
  //

  static (bool isValid, {String? message}) isNotEmpty(String? value) {
    var isValid = value?.isEmpty ?? false;
    return (
      isValid,
      message: !isValid ? '!فیلد نمیتواند خالی باشد' : null,
    );
  }

  static (bool isValid, {String? message}) nationalCode(String? code) {
    var isEmptyRes = isNotEmpty(code);
    if (!isEmptyRes.$1) {
      return isEmptyRes;
    }
    var isValid = code!.isValidIranianNationalCode();
    return (isValid, message: !isValid ? 'گد کلی صحیح نمی‌باشد' : null);
  }

  static (bool isValid, {String? message}) mobileNumber(String? mobileNumber) {
    var isEmptyRes = isNotEmpty(mobileNumber);
    if (!isEmptyRes.$1) {
      return isEmptyRes;
    }
    var isValid = mobileNumber!.isValidIranianMobileNumber();
    return (
      isValid,
      message: !isValid ? 'گد کلی صحیح نمی‌باشد' : null,
    );
  }
}
