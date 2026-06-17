import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class Validator {
  Validator._();

  static String? validate(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.fieldIsRequired.tr();
    }
    return null;
  }
  static String? validateName(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.fieldIsRequired.tr();
    }

    // Minimum 2 characters
    if (value!.trim().length < 2) {
      return LocaleKeys.nameMustBeAtLeast2Chars.tr();
    }

    // Allow only letters and spaces
    final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return LocaleKeys.nameWithoutSpecialChars.tr();
    }

    return null;
  }

  static String? validateCountry(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.countryIsRequired.tr();
    }
    return null;
  }

  static String? validateCity(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.cityIsRequired.tr();
    }
    return null;
  }

  static String? validateRegion(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.regionIsRequired.tr();
    }
    return null;
  }

  static String? validateGender(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.genderIsRequired.tr();
    }
    return null;
  }

  static String? validateDateOfBirth(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.dateOfBirthIsRequired.tr();
    }
    return null;
  }

  static String? validateOTP(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.otpIsRequired.tr();
    }
    if (value?.length != 5) {
      return LocaleKeys.otpMustBe5Digits.tr();
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
      return LocaleKeys.passwordIsRequired.tr();
    }
    if (!RegExp(lengthPattern).hasMatch(value)) {
      return LocaleKeys.mustBeAtLeast8CharactersLong.tr();
    }
    if (!RegExp(atLeastOneUpper).hasMatch(value)) {
      return LocaleKeys.mustContainAtLeastOneUppercaseLetter.tr();
    }
    if (!RegExp(atLeastOneLower).hasMatch(value)) {
      return LocaleKeys.mustContainAtLeastOneLowerCase.tr();
    }
    if (!RegExp(atLeastOneDigit).hasMatch(value)) {
      return LocaleKeys.mustContainAtLeastOneNumber.tr();
    }
    if (!RegExp(atLeastOneSpecial).hasMatch(value)) {
      return LocaleKeys.mustContainAtLeastOneSpecialCharacter.tr();
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? confirm) {
    if (value != confirm) {
      return LocaleKeys.twoPasswordsMustBeIdentical.tr();
    }
    return null;
  }

  static String? validateEmail(String? value) {
    // Updated regex pattern
    final pattern =
        r'^[a-zA-Z0-9][a-zA-Z0-9\+\.\_\%\-\+]{0,255}\@[a-zA-Z][a-zA-Z0-9\-]{0,63}\.[a-zA-Z]{2,}$';

    RegExp regex = RegExp(pattern);
    if (value?.isEmpty ?? true) {
      return LocaleKeys.fieldIsRequired.tr();
    }
    if (value == null || value.isEmpty) {
      return null;
    }
    if (!regex.hasMatch(value)) {
      return LocaleKeys.enterTheCorrectEmail.tr();
    } else {
      return null;
    }
  }

  static String? validateEgyptianMobile(String? value) {
    RegExp digitsOnly = RegExp(r'^[0-9]+$');
    RegExp egyptMobileNsFormat = RegExp(r'^1[0125][0-9]{8}$');

    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.phoneNumberIsRequired.tr();
    }

    // 1) Normalize: remove spaces, dashes, parentheses
    String input = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    // 2) Handle optional country code +20
    if (input.startsWith('+')) {
      // Only +20 is allowed as country code
      if (!input.startsWith('+20')) {
        return LocaleKeys.phoneNumberIsIncorrect.tr();
      }
      input = input.substring(3);
    }

    if (input.startsWith('0')) {
      input = input.substring(1);
    }

    if (!digitsOnly.hasMatch(input)) {
      return LocaleKeys.phoneNumberIsIncorrect.tr();
    }

    if (input.length != 10) {
      return LocaleKeys.phoneNumberLengthMustBe10.tr();
    }

    if (!input.startsWith('1')) {
      return LocaleKeys.mustStartWith1.tr();
    }

    if (!egyptMobileNsFormat.hasMatch(input)) {
      return LocaleKeys.phoneNumberIsIncorrect.tr();
    }

    return null;
  }
  static String? validateSaudiMobile(String? value) {
    String pattern = r'^[0-9]{9,9}$';
    RegExp regExp = RegExp(pattern);
    if (value==null||value.isEmpty) {
      return LocaleKeys.mobileNumberIsRequired.tr();
    }
    else if(!value.trim().startsWith('05')){
      return LocaleKeys.phoneMustStartWith05.tr();
    }
    else if (value.length != 10) {
      return LocaleKeys.mobileNumberMustBe10Digits.tr();
    }
    return null;
  }
}
