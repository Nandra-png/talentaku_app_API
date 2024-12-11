import 'package:flutter/material.dart';

class CustomTextFieldModel {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final TextInputType keyboardType;
  final Function(String)? onChanged;

  CustomTextFieldModel({
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });
}
