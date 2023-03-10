import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

bool verifyEmail(String email){
  // On accepte que les mail de type visionstrategie.com ou sifca.com example.com
  if (GetUtils.isEmail(email)){
    return true;
  }
  return false;
}

String valueToDisplayValue(double value){
  double num = value;
  int magnitude = 0 ;
  while( num.abs() >= 1000){
    magnitude += 1;
    num /= 1000.0;
  }
  double result = math.pow(1000, magnitude) as double;
  return '${result.toStringAsFixed(2)}${['', 'K', 'M', 'B', 'T'][magnitude]}';
}



bool validatePassword(String value) {
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

String encryptSymetric(String password){

  final plainText = password;
  final key = Key.fromUtf8('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzb21lIjoicGF5bG9hZCJ9.4twFt5NiznN84AWoo1d7KO1T_yoc0Z6XOpOVswacPZg');
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(key));
  final encrypted = encrypter.encrypt(plainText, iv: iv);

  return encrypted.base64;
}

String hashPassword(String password){
  var bytes = utf8.encode(password);
  String hashPassword = sha256.convert(bytes).toString();
  return hashPassword;
}
