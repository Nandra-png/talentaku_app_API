import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:talentaku_app/models/notification_event.dart';

class NotificationController extends GetxController {
  final RxInt selectedCategory = 0.obs;
  final RxList<NotificationEvent> notifications = <NotificationEvent>[].obs;


  final backgroundColor = const Color(0xFFF9F9F9);
  final headerColor = const Color(0xFF6E85E8);
  final selectedBorderColor = const Color(0xFF5668B5);
  final unselectedBorderColor = const Color(0xFF393939);
  final textColor = const Color(0xFF353535);

  final List<String> categories = [
    'Semua',
    'Materi & Tugas',
    'Pengumuman Sekolah',
    'Laporan Pembelajaran'
  ];

  @override
  void onInit() {
    super.onInit();
    loadDummyNotifications();
  }

  void changeCategory(int index) {
    selectedCategory.value = index;
  }

  List<NotificationEvent> getFilteredNotifications() {
    if (selectedCategory.value == 0) return notifications;
    return notifications
        .where((n) => n.category == selectedCategory.value)
        .toList();
  }

  void loadDummyNotifications() {
    notifications.addAll([
      NotificationEvent(
        title: 'Matematika Lanjut',
        date: 'May, 05 2024',
        category: 1,
        isUnread: true,
        icon: 'images/boy1.png',
      ),
      NotificationEvent(
        title: 'Laporan Harian',
        date: 'March, 03 2024',
        category: 3,
        isUnread: true,
        icon: 'images/boy1.png',
      ),
      NotificationEvent(
        title: 'Pengumuman Libur',
        date: 'April, 07 2024',
        category: 2,
        isUnread: false,
        icon: 'images/boy1.png',
      ),
    ]);
  }


  BoxDecoration getNotificationCardDecoration(bool isUnread) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: isUnread ? Border.all(color: headerColor) : null,
      boxShadow: [
        BoxShadow(
          color: const Color(0x051E1E1E),
          blurRadius: 10,
          offset: const Offset(0, 1),
        ),
      ],
    );
  }

  BoxDecoration getCategoryTabDecoration(int index) {
    return BoxDecoration(
      border: Border.all(
        color: selectedCategory.value == index
            ? selectedBorderColor
            : unselectedBorderColor,
      ),
      borderRadius: BorderRadius.circular(15),
    );
  }

  void goBack() {
    Get.back();
  }

  IconData getNotificationIcon(int category, String title) {

    switch (category) {
      case 1: 
        if (title.toLowerCase().contains('matematika')) {
          return Icons.calculate_outlined;
        } else if (title.toLowerCase().contains('bahasa')) {
          return Icons.language;
        }
        return Icons.book_outlined;

      case 2: 
        if (title.toLowerCase().contains('libur')) {
          return Icons.event_available;
        } else if (title.toLowerCase().contains('ujian')) {
          return Icons.assignment_outlined;
        }
        return Icons.campaign_outlined;

      case 3:
        if (title.toLowerCase().contains('harian')) {
          return Icons.assessment_outlined;
        } else if (title.toLowerCase().contains('semester')) {
          return Icons.summarize_outlined;
        }
        return Icons.description_outlined;

      default:
        return Icons.notifications_outlined;
    }
  }

  Color getNotificationIconColor(int category) {
    switch (category) {
      case 1: 
        return const Color(0xFF4CAF50);
      case 2: 
        return const Color(0xFF2196F3);
      case 3: 
        return const Color(0xFFF44336); 
      default:
        return const Color(0xFF9E9E9E);
    }
  }
}
