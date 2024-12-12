import 'package:flutter/material.dart';

// class UserModel {
//   final String name;
//   final String nis;
//   final String birthPlaceAndDate;
//   final String address;
//   final String group;

//   UserModel({
//     required this.name,
//     required this.nis,
//     required this.birthPlaceAndDate,
//     required this.address,
//     required this.group,
//   });
// }

class TextPair {
  final String primaryText;
  final String secondaryText;
  final TextStyle primaryStyle;
  final TextStyle secondaryStyle;
  final CrossAxisAlignment alignment;
  final IconData? icon;

  TextPair({
    required this.primaryText,
    required this.secondaryText,
    required this.primaryStyle,
    required this.secondaryStyle,
    required this.alignment,
    this.icon, // Add optional icon
  });

  
}


