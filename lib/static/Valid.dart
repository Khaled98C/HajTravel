// ignore: unused_import
import 'package:flutter/cupertino.dart';
import 'package:project/static/Message.dart';

validInput(String val, int min, int max) {
  if (val.trim().length > max) {
    return "$messageInputmax $max";
  }
  if (val.trim().isEmpty) {
    return "$messageInputEmpty   ";
  }
  if (val.trim().length < min) {
    return "$messageInputmin  $min";
  }
  
}

validemail(String val, int min, int max) {
  if (val.trim().length > max) {
    return "$messageInputmax $max";
  }
  if (val.trim().isEmpty) {
    return "لايمكن ان يكون البريد الالكتروني فارغ   ";
  }
  if (val.trim().length < min) {
    return "لا يمكن ان يكون البريد الالكتروني اقل من  $min";
  }

  Pattern pattern = (r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  RegExp regex = RegExp("$pattern");
  if (!regex.hasMatch(val)) {
    return "[gogo@gmail.com]...البريد الالكتروني يجب ان يكون على سبيل المثال";
  }
}
validbirthday(String val) {
  if (val.trim().isEmpty) {
    return "ادخل التاريخ الصحيح";
  }
}