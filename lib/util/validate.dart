import 'package:flutter/material.dart';
import 'package:healthline/presentation/resources/string_manager.dart';
import 'package:healthline/util/translate.dart';

class Validate {
  String? validateEmail(BuildContext context, String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isEmpty
        ? StringManager.pleaseEnterEmail.translate(context)
        : !regex.hasMatch(value)
            ? StringManager.invalidEmail.translate(context)
            : null;
  }

  String? validatePassword(BuildContext context, String? value) {
    RegExp uppercase = RegExp(r'^(?=.*[A-Z])');
    RegExp lowercase = RegExp(r'^(?=.*[a-z])');
    RegExp number = RegExp(r'^(?=.*[0-9])');
    RegExp special = RegExp(r'^(?=.*[\$\]\\`~!@#&*~%^&*()+=_{}[|;:<>,.?/-])');
    RegExp regex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[\$\]\\`~!@#&*~%^&*()+=_{}[|;:<>,.?/-]).{8,}$');

    String error = "";

    if (value!.isEmpty) {
      return StringManager.pleaseEnterPassword.translate(context);
    } else if (!regex.hasMatch(value)) {
      if (value.length < 8) {
        error += error.isNotEmpty ? "\n" : "";
        error +=
            '- ${StringManager.leastEightCharactersLong.translate(context)}';
      }
      if (!uppercase.hasMatch(value)) {
        error += error.isNotEmpty ? "\n" : "";
        error += '- ${StringManager.leastOneUpperCase.translate(context)}';
      }
      if (!lowercase.hasMatch(value)) {
        error += error.isNotEmpty ? "\n" : "";
        error += '- ${StringManager.leastOneUpperCase.translate(context)}';
      }
      if (!number.hasMatch(value)) {
        error += error.isNotEmpty ? "\n" : "";
        error += '- ${StringManager.leastOneNumber.translate(context)}';
      }
      if (!special.hasMatch(value)) {
        error += error.isNotEmpty ? "\n" : "";
        error +=
            '- ${StringManager.leastOneSpecialCharacter.translate(context)}';
      }
      return error;
    }
    return null;
  }

  String? validatePhone(BuildContext context, String phone) {
    RegExp uppercase = RegExp(r'^(?=.*[A-Z])');
    RegExp lowercase = RegExp(r'^(?=.*[a-z])');
    RegExp special = RegExp(r'^(?=.*?[!@#\$&*~])');

    if (phone.isEmpty) {
      return StringManager.pleaseEnterPhoneNumber.translate(context);
    }

    if (phone.characters.first == '0') {
      phone = phone.replaceFirst('0', '');
    }

    if (uppercase.hasMatch(phone) ||
        lowercase.hasMatch(phone) ||
        special.hasMatch(phone) ||
        phone.length != 9) {
      return StringManager.invalidPhone.translate(context);
    }
    return null;
  }

  String changePhoneFormat(String phone) {
    if (phone.length == 10 && phone.characters.first == '0') {
      phone = phone.replaceFirst('0', '');
    }
    return '+84$phone';
  }

  String? validateSpecialCharacter(BuildContext context, String value) {
    // Biểu thức chính quy để kiểm tra ký tự đặc biệt
    RegExp specialCharRegex = RegExp(r'[!@#%^&*(),.?":{}|<>]');

    // Kiểm tra xem chuỗi có chứa ký tự đặc biệt hay không
    if (specialCharRegex.hasMatch(value)) {
      return StringManager.specialCharacters.translate(context);
    }
    return null;
  }
}
