// lib/core/utils/validator.dart
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class Validator {
  Validator._();

  static String? validate(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.validatorFieldIsRequired.tr();
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.validatorFieldIsRequired.tr();
    }
    if (value!.trim().length < 2) {
      return LocaleKeys.validatorNameMinLength.tr();
    }
    final nameRegex = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return LocaleKeys.validatorNameNoSpecial.tr();
    }
    return null;
  }

  static String? validateTeams(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.validatorFieldIsRequired.tr();
    }
    final int? number = int.tryParse(value!);
    if (number == null) {
      return LocaleKeys.validatorInvalidNumber.tr();
    }
    if (number < 2) {
      return LocaleKeys.validatorTeamsMin.tr();
    }
    if (number > 100) {
      return LocaleKeys.validatorTeamsMax.tr();
    }
    return null;
  }

  static String? validateFee(String? value) {
    if (value?.isEmpty ?? true) {
      return null; // Optional field
    }
    final int? number = int.tryParse(value!);
    if (number == null) {
      return LocaleKeys.validatorInvalidNumber.tr();
    }
    if (number < 0) {
      return LocaleKeys.validatorFeeNegative.tr();
    }
    return null;
  }

  static String? validateStadium(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.validatorStadiumRequired.tr();
    }
    return null;
  }

  static String? validateDate(DateTime? date, String fieldName) {
    if (date == null) {
      return LocaleKeys.validatorDateRequired.tr();
    }
    return null;
  }

  static String? validateDateRange(DateTime? startDate, DateTime? endDate) {
    if (startDate == null || endDate == null) return null;
    if (startDate.isAfter(endDate)) {
      return LocaleKeys.validatorDateRange.tr();
    }
    return null;
  }

  static String? validatePrize(String? value) {
    if (value?.isEmpty ?? true) {
      return null; // Optional field
    }
    final int? number = int.tryParse(value!);
    if (number == null) {
      return LocaleKeys.validatorInvalidNumber.tr();
    }
    if (number < 0) {
      return LocaleKeys.validatorPrizeNegative.tr();
    }
    return null;
  }

  // ─── Additional Validators ──────────────────────────────────────────────

  static String? validateCountry(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.validatorCountryRequired.tr();
    }
    return null;
  }

  static String? validateCity(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.validatorCityRequired.tr();
    }
    return null;
  }

  static String? validateRegion(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.validatorRegionRequired.tr();
    }
    return null;
  }

  static String? validateGender(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.validatorGenderRequired.tr();
    }
    return null;
  }

  static String? validateDateOfBirth(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.validatorDobRequired.tr();
    }
    return null;
  }

  static String? validateOTP(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.validatorOtpRequired.tr();
    }
    if (value?.length != 5) {
      return LocaleKeys.validatorOtpLength.tr();
    }
    return null;
  }

  static String? validatePassword(String? value) {
    String atLeastOneUpper = r'^(?=.*[A-Z])';
    String atLeastOneLower = r'^(?=.*[a-z])';
    String atLeastOneDigit = r'^(?=.*?[0-9])';
    String atLeastOneSpecial = r'^(?=.*?[!@#\$&*~?%^])';
    String lengthPattern = r'^.{8,}';
    if (value == null || value.isEmpty) {
      return LocaleKeys.validatorPasswordRequired.tr();
    }
    if (!RegExp(lengthPattern).hasMatch(value)) {
      return LocaleKeys.validatorPasswordMinLength.tr();
    }
    if (!RegExp(atLeastOneUpper).hasMatch(value)) {
      return LocaleKeys.validatorPasswordUppercase.tr();
    }
    if (!RegExp(atLeastOneLower).hasMatch(value)) {
      return LocaleKeys.validatorPasswordLowercase.tr();
    }
    if (!RegExp(atLeastOneDigit).hasMatch(value)) {
      return LocaleKeys.validatorPasswordNumber.tr();
    }
    if (!RegExp(atLeastOneSpecial).hasMatch(value)) {
      return LocaleKeys.validatorPasswordSpecial.tr();
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? confirm) {
    if (value != confirm) {
      return LocaleKeys.validatorConfirmPassword.tr();
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final pattern =
        r'^[a-zA-Z0-9][a-zA-Z0-9\+\.\_\%\-\+]{0,255}\@[a-zA-Z][a-zA-Z0-9\-]{0,63}\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    if (value?.isEmpty ?? true) {
      return LocaleKeys.validatorEmailRequired.tr();
    }
    if (value == null || value.isEmpty) {
      return null;
    }
    if (!regex.hasMatch(value)) {
      return LocaleKeys.validatorEmailInvalid.tr();
    }
    return null;
  }

  static String? validateEgyptianMobile(String? value) {
    RegExp digitsOnly = RegExp(r'^[0-9]+$');
    RegExp egyptMobileNsFormat = RegExp(r'^1[0125][0-9]{8}$');

    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.validatorPhoneRequired.tr();
    }

    String input = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    if (input.startsWith('+')) {
      if (!input.startsWith('+20')) {
        return LocaleKeys.validatorPhoneInvalid.tr();
      }
      input = input.substring(3);
    }

    if (input.startsWith('0')) {
      input = input.substring(1);
    }

    if (!digitsOnly.hasMatch(input)) {
      return LocaleKeys.validatorPhoneInvalid.tr();
    }

    if (input.length != 10) {
      return LocaleKeys.validatorPhoneLength.tr();
    }

    if (!input.startsWith('1')) {
      return LocaleKeys.validatorPhoneStartWith1.tr();
    }

    if (!egyptMobileNsFormat.hasMatch(input)) {
      return LocaleKeys.validatorPhoneInvalid.tr();
    }

    return null;
  }

  static String? validateSaudiMobile(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validatorPhoneRequired.tr();
    }
    if (!value.trim().startsWith('05')) {
      return LocaleKeys.validatorPhoneStartWith05.tr();
    }
    if (value.length != 10) {
      return LocaleKeys.validatorPhoneMobileLength.tr();
    }
    return null;
  }
}