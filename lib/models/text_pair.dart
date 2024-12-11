import 'package:flutter/material.dart';

class CustomTextPairModel {
  final String primaryText;
  final String secondaryText;
  final TextStyle primaryStyle;
  final TextStyle secondaryStyle;
  final CrossAxisAlignment alignment;

  CustomTextPairModel({
    required this.primaryText,
    required this.secondaryText,
    this.primaryStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.black,
    ),
    this.secondaryStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    this.alignment = CrossAxisAlignment.center,
  });
}
