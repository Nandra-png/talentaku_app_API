import 'package:flutter/material.dart';

class InfoPopupEvent {
  final String title;
  final String message;
  final IconData icon;
  final Color? iconColor;

  InfoPopupEvent({
    required this.title,
    required this.message,
    required this.icon,
    this.iconColor,
  });
}
