import 'dart:developer';

import 'package:intl/intl.dart';

class HelperMethods {
  ///Date&Time Format
  String formatDate(String dateTime) {
    DateTime newDate = DateTime.parse(dateTime);
    final DateFormat formatter = DateFormat('dd-MMM-yyyy hh:mm a');
    final String date = formatter.format(newDate);
    return date;
  }

  ///DateFormat
  String formatOnlyDate(String dateTime) {
    DateTime newDate = DateTime.parse(dateTime);
    final DateFormat formatter = DateFormat('dd-MMM-yyyy');
    final String date = formatter.format(newDate);
    return date;
  }

  ///TimeFormat
  String formatOnlyTime(String dateTime) {
    DateTime newDate = DateTime.parse(dateTime);
    final DateFormat formatter = DateFormat('hh:MM a');
    final String date = formatter.format(newDate);
    return date;
  }

  /// Empty Field validation
  String? emptyField(value, fieldName) {
    if (value.isEmpty) {
      return 'Please enter : $fieldName';
    }
    return null;
  }

  ///Password Validation
  String? validatePassword(value) {
    bool passValid =
        RegExp("^(?=.{8,32}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*")
            .hasMatch(value);
    log("validate password");
    log(RegExp("^(?=.{8,32}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*")
        .hasMatch(value)
        .toString());
    if (value.isEmpty) {
      return 'This is a required field and must be at least 3 characters.';
    }

    if (!passValid) {
      return 'Enter valid password';
    }
    return null;
  }
}
