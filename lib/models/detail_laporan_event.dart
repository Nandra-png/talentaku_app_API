class DetailLaporanEvent {
  final String title;
  final String semester;
  final String date;
  final List<LaporanSection> sections;

  DetailLaporanEvent({
    required this.title,
    required this.semester,
    required this.date,
    required this.sections,
  });
}

class LaporanSection {
  final String title;
  final String content;
  final bool isExpanded;

  LaporanSection({
    required this.title,
    required this.content,
    this.isExpanded = false,
  });
} 