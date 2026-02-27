import 'package:get/get.dart';

class Validation {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'name_required'.tr;
    }
    if (value.trim().length < 3) {
      return 'name_min_length'.tr;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'email_required'.tr;
    }
    if (!GetUtils.isEmail(value.trim())) {
      return 'email_invalid'.tr;
    }
    return null;
  }

  static bool isValidBangladeshiPhone(String phone) {
    final pattern = RegExp(r'^(?:\+88)?01[3-9]\d{8}$');
    return pattern.hasMatch(phone);
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'phone_required'.tr;
    }
    if (!isValidBangladeshiPhone(value.trim())) {
      return 'phone_invalid'.tr;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'password_required'.tr;
    }
    if (value.length < 6) {
      return 'password_min_length'.tr;
    }
    return null;
  }
}
