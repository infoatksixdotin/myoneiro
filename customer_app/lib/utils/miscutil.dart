import 'package:email_validator/email_validator.dart';
import 'package:string_validator/string_validator.dart';

class MiscUtil {
  static bool validateEmail(String emailId) {
    return EmailValidator.validate(emailId);
  }
  static bool validatePhone(int phone) {
    String strPhone = phone.toString();
    return (strPhone.length == 10);
  }
  static bool validateName(String name) {
    return (name.length > 0 && isAlpha(name));
  }
}