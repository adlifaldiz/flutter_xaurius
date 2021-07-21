import 'package:get/get.dart';

import 'package:flutter_xaurius/app/helpers/text_controller_utils.dart';

String validateEmail(String value) {
  if (value.isEmpty) {
    return 'login_email'.tr + 'empty_field'.tr;
  } else if (!GetUtils.isEmail(value)) {
    return 'wrong_format'.tr + 'login_email'.tr;
  } else {
    return null;
  }
}

String validatePin(String value) {
  if (value.isEmpty) {
    return 'Pin' + 'empty_field'.tr;
  } else if (value.length != 6) {
    return 'Pin' + 'must_6'.tr;
  } else {
    return null;
  }
}

String validateVerifPin(String value, String pin) {
  if (value.isEmpty) {
    return 'confirm_pin_app_bar'.tr + 'empty_field'.tr;
  } else if (value.length < 6) {
    return 'confirm_pin_app_bar'.tr + 'must_6'.tr;
  } else if (value != pin) {
    return 'confirm_pin_app_bar'.tr + 'not_match'.tr;
  } else {
    return null;
  }
}

String validateCode(String value) {
  if (value.isEmpty) {
    return 'verif_app_bar'.tr + 'empty_field'.tr;
  } else if (value.length != 6) {
    return 'verif_app_bar'.tr + 'must_6'.tr;
  } else {
    return null;
  }
}

//kyc
String validateName(String value) {
  if (value.isEmpty) {
    return 'full_name'.tr + 'empty_field'.tr;
  } else {
    return null;
  }
}

String validatePhone(String value) {
  if (value.isEmpty) {
    return 'phone_number'.tr + 'empty_field'.tr;
  } else {
    return null;
  }
}

String validateDate(String value) {
  if (value.isEmpty) {
    return 'birth_date'.tr + 'empty_field'.tr;
  } else {
    return null;
  }
}

String validateAddress(String value) {
  if (value.isEmpty) {
    return 'home_address'.tr + 'empty_field'.tr;
  } else {
    return null;
  }
}

String validateCity(String value) {
  if (value.isEmpty) {
    return 'city'.tr + 'empty_field'.tr;
  } else {
    return null;
  }
}

String validateKode(String value) {
  if (value.isEmpty) {
    return 'postal_code'.tr + 'empty_field'.tr;
  } else {
    return null;
  }
}

String validateCountry(String value) {
  if (value.isEmpty) {
    return 'country'.tr + 'empty_field'.tr;
  } else {
    return null;
  }
}

String validateKTP(String value) {
  if (value.isEmpty) {
    return 'id_num'.tr + 'empty_field'.tr;
  } else {
    return null;
  }
}

String validateNPWP(String value) {
  if (value.isEmpty) {
    return 'npwp_notif'.tr + 'empty_field'.tr;
  } else {
    return null;
  }
}

//bank
String validateNameBank(String value) {
  if (value.isEmpty) {
    return 'bank_name'.tr + 'empty_field'.tr;
  } else {
    return null;
  }
}

String validateNameAccBank(String value) {
  if (value.isEmpty) {
    return 'bank_acc_name'.tr + 'empty_field'.tr;
  } else {
    return null;
  }
}

String validateNumAccBank(String value) {
  if (value.isEmpty) {
    return 'bank_num_name'.tr + 'empty_field'.tr;
  } else {
    return null;
  }
}

//buy create
String validateToken(String value) {
  if (value.isEmpty || value[0] == '.') {
    return 'quantity_xau'.tr + 'empty_field'.tr;
  } else if (double.parse(value) <= 0) {
    return 'quantity_xau'.tr + 'cant_0'.tr;
  } else {
    return null;
  }
}

String validateSubTotal(NumericTextController value) {
  if (value.text.isEmpty) {
    return 'total_xau'.tr + 'empty_field'.tr;
  } else if (value.numberValue <= 0) {
    return 'total_xau'.tr + 'cant_0'.tr;
  } else if (value.numberValue < 50000) {
    return 'min_buy'.tr + ' IDR 50000';
  } else {
    return null;
  }
}

//checkout
String validateWallet(String value) {
  if (value.isEmpty) {
    return 'Wallet Address tidak boleh kosong';
  } else {
    return null;
  }
}

//deposit

String validateNominalTopTup(NumericTextController value) {
  if (value.text.isEmpty) {
    return 'Nominal' + 'empty_field'.tr;
  } else if (value.numberValue <= 0) {
    return 'Nominal' + 'cant_0'.tr;
  } else if (value.numberValue < 100000) {
    return 'min_buy'.tr + ' IDR 100000';
  } else {
    return null;
  }
}

String validateWdAddress(String value) {
  if (value.isEmpty) {
    return 'reciepent_address'.tr + 'empty_field'.tr;
  } else {
    return null;
  }
}

String validateWdToken(String value, double qty) {
  if (value.isEmpty) {
    return 'empty_field'.tr;
  } else if (double.parse(value) <= 0) {
    return 'cant_0'.tr;
  } else if (double.parse(value) > qty) {
    return 'insufficient_balance'.tr;
  } else {
    return null;
  }
}

String validateWdIdr(String value, double qty) {
  if (value.isEmpty) {
    return '';
  } else if (double.parse(value) <= 0) {
    return '';
  } else if (double.parse(value) > qty) {
    return '';
  } else {
    return null;
  }
}

String validateWdOtp(String value) {
  if (value.isEmpty) {
    return 'OTP' + 'empty_field'.tr;
  } else {
    return null;
  }
}


// String validateEmail(String value) {
//   if (value.isEmpty) {
//     return 'Alamat email tidak boleh kosong';
//   } else if (!RegExp(emailValidationRule).hasMatch(value)) {
//     return 'Format email salah';
//   } else {
//     return null;
//   }
// }

// String validatePin(String value) {
//   if (value.isEmpty) {
//     return 'Pin tidak boleh kosong';
//   } else {
//     return null;
//   }
// }

// bool validateEmailStructure(String value) {
//   String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
//   RegExp regExp = new RegExp(pattern);
//   return regExp.hasMatch(value);
// }

// bool validateEmptyForm(String value) {
//   if (value == null || value.isEmpty) {
//     return false;
//   }
//   return true;
// }

// bool validatePasswordForm(String value) {
//   if (value == null || value.length < 6) {
//     return false;
//   }
//   return true;
// }

// bool validatePinForm(String value) {
//   if (value == null || value.length < 6) {
//     return false;
//   }
//   return true;
// }

// bool validateEmailForm(String value) {
//   if (value == null) {
//     return false;
//   } else if (!RegExp(emailValidationRule).hasMatch(value)) {
//     return false;
//   }
//   return true;
// }

// bool validateNumberForm(String value) {
//   if (value == null) {
//     return false;
//   } else if (!RegExp(numberValidationRule).hasMatch(value)) {
//     return false;
//   }
//   return true;
// }

// bool validateAlphabetForm(String value) {
//   if (value == null) {
//     return false;
//   } else if (!RegExp(alphabetValidationRule).hasMatch(value)) {
//     return false;
//   }
//   return true;
// }

// bool validateMobilePhoneNumberForm(String value) {
//   if (value == null) {
//     return false;
//   } else if (!value.startsWith('08')) {
//     return false;
//   } else if (!RegExp(numberValidationRule).hasMatch(value)) {
//     return false;
//   }
//   return true;
// }

// final reverseError = StreamTransformer<String, String>.fromHandlers(handleData: (error, sink) {
//   if (error == null) {
//     sink.add(' ');
//   } else {
//     sink.addError(error);
//   }
// });

// final validateStreamEmptyForm = StreamTransformer<String, String>.fromHandlers(handleData: (input, sink) {
//   if (input.length != 0) {
//     sink.add(input);
//   } else {
//     sink.addError('wajib diisi');
//   }
// });

// final validatePassword = StreamTransformer<String, String>.fromHandlers(handleData: (input, sink) {
//   if (input.length >= 6) {
//     sink.add(input);
//   } else {
//     sink.addError('minimal 6 karakter');
//   }
// });

// final validatePin = StreamTransformer<String, String>.fromHandlers(handleData: (input, sink) {
//   if (input.length == 6) {
//     sink.add(input);
//   } else {
//     sink.addError('berjumlah 6 digit');
//   }
// });

// final validateEmail = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
//   if (email.length != 0) {
//     RegExp regExp = new RegExp(emailValidationRule);
//     if (regExp.hasMatch(email)) {
//       sink.add(email);
//     } else {
//       sink.addError('Masukkan email yang valid');
//     }
//   } else {
//     sink.addError('Email wajib diisi');
//   }
// });

// final validateNumber = StreamTransformer<String, String>.fromHandlers(handleData: (input, sink) {
//   RegExp regExp = new RegExp(numberValidationRule);
//   if (regExp.hasMatch(input)) {
//     sink.add(input);
//   } else {
//     sink.addError('hanya dapat diisi dengan angka');
//   }
// });

// final validatePhoneNumber = StreamTransformer<String, String>.fromHandlers(handleData: (input, sink) {
//   RegExp regExp = new RegExp(numberValidationRule);
//   if (regExp.hasMatch(input)) {
//     if (input.startsWith('08')) {
//       sink.add(input);
//     } else {
//       sink.addError("harus diawali dengan angka '08'");
//     }
//   } else {
//     sink.addError('hanya dapat diisi dengan angka');
//   }
// });

// final validateAlphabet = StreamTransformer<String, String>.fromHandlers(handleData: (input, sink) {
//   RegExp regExp = new RegExp(alphabetValidationRule);
//   if (regExp.hasMatch(input)) {
//     sink.add(input);
//   } else {
//     sink.addError('Hanya dapat diisi dengan huruf');
//   }
// });
