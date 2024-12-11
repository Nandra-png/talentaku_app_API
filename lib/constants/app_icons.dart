import 'package:flutter/material.dart';

class AppIcons {
  // Icons untuk section laporan
  static IconData getLaporanSectionIcon(String title) {
    switch (title.toLowerCase()) {
      case 'kegiatan awal':
        return Icons.wb_sunny_outlined;
      case 'kegiatan inti':
        return Icons.star_outline;
      case 'snack time':
        return Icons.restaurant_outlined;
      case 'kegiatan inklusi':
        return Icons.people_outline;
      case 'catatan khusus':
        return Icons.note_outlined;
      default:
        return Icons.circle_outlined;
    }
  }

  // Icons untuk filter
  static const IconData filterAll = Icons.list_alt;
  static const IconData filterWeek = Icons.date_range;
  static const IconData filterDate = Icons.calendar_today;
  
  // Icons untuk header
  static const IconData back = Icons.arrow_back;
  static const IconData semester = Icons.school_outlined;
  static const IconData calendar = Icons.calendar_today_outlined;
} 