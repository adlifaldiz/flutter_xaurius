import 'package:intl/intl.dart';

const String numberValidationRule = r'^[0-9]*$';
const String decimalValidationRule = r'(^\d*\.?\,?\d*)';
const String emailValidationRule =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
const String alphabetValidationRule = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
const String passwordValidationRule = '((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#%]).{6,10})';
const String telkomselRule = '^(811|812|813|821|822|823|852|853|851)';
const String indosatRule = '^(814|815|816|855|856|857|858)';
const String xlRule = '^(817|818|819|859|877|878)';
const String axisRule = '^(838|831|832|833)';
const String smartfrenRule = '^(881|882|883|884|885|886|887|888|889)';
//const String telkomselRule = '^(0811|0812|0813|0821|0822|0823|0852|0853|0851)';
//const String indosatRule = '^(0814|0815|0816|0855|0856|0857|0858)';
//const String xlRule = '^(0817|0818|0819|0859|0877|0878)';
//const String axisRule = '^(0838|0831|0832|0833)';
//const String smartfrenRule = '^(0881|0882|0883|0884|0885|0886|0887|0888|0889)';
String emptyValidationRule(String value) => value?.length != 0 ? null : 'Form tidak boleh kosong';
DateFormat formatter = DateFormat('yyyy-MM-dd');
