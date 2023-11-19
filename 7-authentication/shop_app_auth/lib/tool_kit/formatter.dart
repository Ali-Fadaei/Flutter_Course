import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

abstract class Formatter {
  //

  static var mobileNumber = MaskedInputFormatter('0000-000-00-00');

  static var nationalId = MaskedInputFormatter('00000000000');

  static var pinCode = MaskedInputFormatter('0000');
}
