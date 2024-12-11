class NotificationEvent {
  final String title;
  final String date;
  final int category;
  final bool isUnread;
  final String icon;

  NotificationEvent({
    required this.title,
    required this.date,
    required this.category,
    required this.isUnread,
    required this.icon,
  });
}
