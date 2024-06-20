import 'package:base_project_flutter/export.dart';

class TextFieldsValidator {
  // Regex Patterns
  static final RegExp _usernameRegex = RegExp(r'^[a-zA-Z][a-zA-Z0-9]*$');
  static final RegExp _emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  static final RegExp _zipCodeRegex = RegExp(r'^\d{5}$');
  static final RegExp _onlyDigitsWithDecimalRegex = RegExp(r'^\d*\.?\d*');
  static final RegExp _onlyAlphabetsRegex = RegExp(r'[a-zA-Z]');
  static final RegExp _alphabetsAndSpacesRegex = RegExp(r'[a-zA-Z\s]');

  // Validators
  static String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return LabelConst.requiredNameLabel;
    }
    return null;
  }

  static String? ageValidation(String? value) {
    if (value == null || value.isEmpty) {
      return LabelConst.requiredAgeLabel;
    } else if (int.tryParse(value) == null) {
      return LabelConst.invalidAgeLabel;
    }
    return null;
  }

  static String? mobileNumberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return LabelConst.requiredMobileNumberLabel;
    } else if (value.length != 10) {
      return LabelConst.invalidMobileNumberLabel;
    }
    return null;
  }

  static String? usernameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return LabelConst.requiredUsernameLabel;
    } else if (!_usernameRegex.hasMatch(value)) {
      return LabelConst.invalidUsernameLabel;
    }
    return null;
  }

  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return LabelConst.requiredEmailLabel;
    } else if (!_emailRegex.hasMatch(value)) {
      return LabelConst.invalidEmailLabel;
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return LabelConst.requiredPasswordLabel;
    } else if (value.length < 6) {
      return LabelConst.invalidPasswordLabel;
    }
    return null;
  }

  static String? confirmPasswordValidation(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return LabelConst.requiredConfirmPasswordLabel;
    } else if (password != confirmPassword) {
      return LabelConst.mismatchConfirmPasswordLabel;
    }
    return null;
  }

  static String? addressValidation(String? value) {
    if (value == null || value.isEmpty) {
      return LabelConst.requiredAddressLabel;
    }
    return null;
  }

  static String? zipCodeValidation(String? value) {
    if (value == null || value.isEmpty) {
      return LabelConst.requiredZipCodeLabel;
    } else if (!_zipCodeRegex.hasMatch(value)) {
      return LabelConst.invalidZipCodeLabel;
    }
    return null;
  }

  // Input formatters
  static final TextInputFormatter onlyDigits = FilteringTextInputFormatter.digitsOnly;
  static final TextInputFormatter firstLetterAlphabetsAndDigits = FilteringTextInputFormatter.allow(_usernameRegex);
  static final TextInputFormatter onlyDigitsWithDecimal =
      FilteringTextInputFormatter.allow(_onlyDigitsWithDecimalRegex);
  static final TextInputFormatter onlyAlphabets = FilteringTextInputFormatter.allow(_onlyAlphabetsRegex);
  static final TextInputFormatter alphabetsAndSpaces = FilteringTextInputFormatter.allow(_alphabetsAndSpacesRegex);
}
