import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/regex_rule.dart';
import 'package:get/get.dart';

String validateEmail(String value) {
  if (value.isEmpty) {
    return 'Alamat email tidak boleh kosong';
  } else if (!GetUtils.isEmail(value)) {
    return 'Format email salah';
  } else {
    return null;
  }
}

String validatePin(String value) {
  if (value.isEmpty) {
    return 'Pin tidak boleh kosong';
  } else if (value.length != 6) {
    return 'Pin harus 6 digit';
  } else {
    return null;
  }
}

String validateVerifPin(String value, String pin) {
  if (value.isEmpty) {
    return 'Confirmation Pin Cannot be empty';
  } else if (value.length < 6) {
    return 'Confirmation Pin must be 6 digits';
  } else if (value != pin) {
    return 'Confirmation Pin not match';
  } else {
    return null;
  }
}

String validateCode(String value) {
  if (value.isEmpty) {
    return 'Kode verifikasi tidak boleh kosong';
  } else if (value.length != 6) {
    return 'Kode verifikasi harus 6 digit';
  } else {
    return null;
  }
}

//kyc
String validateName(String value) {
  if (value.isEmpty) {
    return 'Nama tidak boleh kosong';
  } else {
    return null;
  }
}

String validatePhone(String value) {
  if (value.isEmpty) {
    return 'Nomor Telepon tidak boleh kosong';
  } else {
    return null;
  }
}

String validateDate(String value) {
  if (value.isEmpty) {
    return 'Tanggal lahir tidak boleh kosong';
  } else {
    return null;
  }
}

String validateAddress(String value) {
  if (value.isEmpty) {
    return 'Alamat tidak boleh kosong';
  } else {
    return null;
  }
}

String validateCity(String value) {
  if (value.isEmpty) {
    return 'Kota tidak boleh kosong';
  } else {
    return null;
  }
}

String validateKode(String value) {
  if (value.isEmpty) {
    return 'Kode pos tidak boleh kosong';
  } else {
    return null;
  }
}

String validateCountry(String value) {
  if (value.isEmpty) {
    return 'Negara tidak boleh kosong';
  } else {
    return null;
  }
}

//bank
String validateNameBank(String value) {
  if (value.isEmpty) {
    return 'Nama Bank tidak boleh kosong';
  } else {
    return null;
  }
}

String validateNameAccBank(String value) {
  if (value.isEmpty) {
    return 'Nama Akun Bank tidak boleh kosong';
  } else {
    return null;
  }
}

String validateNumAccBank(String value) {
  if (value.isEmpty) {
    return 'Nomor Akun Bank tidak boleh kosong';
  } else {
    return null;
  }
}

//buy create
String validateToken(String value) {
  if (value.isEmpty || value[0] == '.') {
    return 'Kuantitas tidak boleh kosong';
  } else if (double.parse(value) <= 0) {
    return 'Kuantitas tidak bisa 0';
  } else {
    // token = double.parse(value);
    return null;
  }
}

String validateSubTotal(String value) {
  if (value.isEmpty) {
    return 'Total harga tidak boleh kosong';
  } else if (double.parse(value) <= 0) {
    return 'Total harga tidak bisa 0';
  } else if (double.parse(value) < 50000) {
    return 'Minimum pembelian IDR 50000';
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
