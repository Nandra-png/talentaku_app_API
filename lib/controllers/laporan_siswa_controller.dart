import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:talentaku_app/apimodels/student_models.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/models/laporan_preview_event.dart';
import 'package:talentaku_app/widgets/date_picker_card.dart';

import '../apiservice/api_service.dart';

class LaporanSiswaController extends GetxController {
  final RxString selectedFilter = 'Semua Laporan'.obs;
  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final RxList<LaporanPreviewEvent> filteredLaporan =
      <LaporanPreviewEvent>[].obs;

  var StudentReport = <Datum>[].obs;
  var isLoading = false.obs;


  final List<String> filterOptions = [
    'Semua Laporan',
    '7 Hari Terakhir',
    'Pilih Tanggal',
  ];

  // Dummy data laporan
  // final List<LaporanPreviewEvent> allLaporan = [
  //   LaporanPreviewEvent(
  //     title: 'Laporan Harian - Rabu',
  //     date: '24 November 2024',
  //     description:
  //         'Perkembangan motorik halus semakin membaik. Siswa dapat mengikuti instruksi dengan baik dan menyelesaikan kegiatan tepat waktu. Hari ini fokus pada kegiatan menulis dan menggambar.',
  //   ),
  //   LaporanPreviewEvent(
  //     title: 'Laporan Harian - Selasa',
  //     date: '20 November 2024',
  //     description:
  //         'Siswa mengikuti kegiatan belajar dengan antusias. Mampu berinteraksi dengan teman-teman dan menunjukkan sikap yang positif dalam aktivitas kelompok.',
  //   ),
  //   LaporanPreviewEvent(
  //     title: 'Laporan Harian - Senin',
  //     date: '12 Maret 2024',
  //     description:
  //         'Hari ini siswa menunjukkan kemajuan yang baik dalam pembelajaran. Aktif berpartisipasi dalam kegiatan kelas dan mampu menyelesaikan tugas dengan baik. Perlu perhatian lebih pada fokus saat kegiatan membaca.',
  //   ),
  // ];

  List<Datum> allLaporan = [
    Datum(
      id: 1,
      created: DateTime.now(),
      semester: 'Semester 1',
      kegiatanAwalDihalaman: ['Kegiatan 1'],
      dihalamanHasil: 'Hasil 1',
      kegiatanAwalBerdoa: ['Doa Awal'],
      berdoaHasil: 'Doa Hasil',
      kegiatanIntiSatu: ['Kegiatan Inti 1'],
      intiSatuHasil: 'Hasil Inti 1',
      kegiatanIntiDua: ['Kegiatan Inti 2'],
      intiDuaHasil: 'Hasil Inti 2',
      kegiatanIntiTiga: ['Kegiatan Inti 3'],
      intiTigaHasil: 'Hasil Inti 3',
      snack: ['Snack 1'],
      inklusi: ['Inklusi 1'],
      inklusiHasil: 'Inklusi Hasil',
      inklusiPenutup: ['Penutup 1'],
      inklusiPenutupHasil: 'Penutup Hasil',
      inklusiDoa: ['Inklusi Doa'],
      inklusiDoaHasil: 'Inklusi Doa Hasil',
      catatan: ['Catatan 1'],
      studentId: 9,
      teacherId: 1,
      media: [],
    ),
  ];

  // Fungsi untuk fetch student report
  void fetchReport() async {
    try {
      isLoading(true);
      final apiService = ApiService();
      final report = await apiService.fetchStudentReport();
      StudentReport.assignAll(report);
    } catch (e) {
      print('Error fetching programs: $e');
      Get.snackbar(
        'Error',
        'Failed to load Student Report',
        backgroundColor: AppColors.error,
        colorText: AppColors.textLight,
      );
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchReport();
    super.onInit();
    StudentReport.value = _sortLaporanByDate(allLaporan);
  }

  // Method untuk mengurutkan laporan berdasarkan tanggal terbaru
  // List<Datum> _sortLaporanByDate(
  //     List<Datum> laporan) {
  //   final DateFormat format = DateFormat('dd MMMM yyyy', 'id_ID');
  //   return List.from(laporan)
  //     ..sort((a, b) {
  //       final DateTime dateA = a.created;
  //       final DateTime dateB = b.created;
  //       return dateB.compareTo(dateA);
  //     });
  // }
  List<Datum> _sortLaporanByDate(List<Datum> laporan) {
    return List.from(laporan)
      ..sort((a, b) => b.created.compareTo(a.created));

  }


  // Method untuk filter laporan
  // void filterLaporan(String value) {
  //   selectedFilter.value = value;
  //   final DateFormat format = DateFormat('dd MMMM yyyy', 'id_ID');
  //
  //   switch (value) {
  //     case '7 Hari Terakhir':
  //       final DateTime now = DateTime.now();
  //       final DateTime sevenDaysAgo = now.subtract(const Duration(days: 7));
  //
  //       StudentReport.value = _sortLaporanByDate(
  //         allLaporan.where((laporan) {
  //           // final DateTime laporanDate = format.parse(laporan.created);
  //           final DateTime laporanDate = laporan.created;
  //           return laporanDate.isAfter(sevenDaysAgo);
  //         }).toList(),
  //       );
  //       break;
  //
  //     case 'Pilih Tanggal':
  //       showDatePicker();
  //       break;
  //
  //     default:
  //       StudentReport.value = _sortLaporanByDate(allLaporan);
  //   }
  // }

  void filterLaporan(String value) {
    selectedFilter.value = value;

    switch (value) {
      case '7 Hari Terakhir':
        final DateTime now = DateTime.now();
        final DateTime sevenDaysAgo = now.subtract(const Duration(days: 7));
        StudentReport.value = _sortLaporanByDate(
          allLaporan.where((laporan) => laporan.created.isAfter(sevenDaysAgo)).toList(),
        );
        break;

      case 'Pilih Tanggal':
        showDatePicker();
        break;

      default:
        StudentReport.value = _sortLaporanByDate(allLaporan);
    }
  }


  // Method untuk menampilkan date picker
  // void showDatePicker() async {
  //   final DateTime? picked = await DatePickerCard.show(
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2024),
  //     lastDate: DateTime.now(),
  //     onDateSelected: (DateTime date) {
  //       selectedDate.value = date;
  //     },
  //   );
  //
  //   if (picked != null) {
  //     final DateFormat format = DateFormat('dd MMMM yyyy', 'id_ID');
  //     final String selectedDateStr = format.format(picked);
  //
  //     StudentReport.value = _sortLaporanByDate(
  //       allLaporan.where((laporan) => laporan.created == selectedDateStr).toList(),
  //     );
  //   }
  // }

  void showDatePicker() async {
    final DateTime? picked = await DatePickerCard.show(
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
      onDateSelected: (DateTime date) {
        selectedDate.value = date;
      },
    );

    if (picked != null) {
      StudentReport.value = _sortLaporanByDate(
        allLaporan.where((laporan) => isSameDay(laporan.created, picked)).toList(),
      );
    }
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }


  // Method untuk mendapatkan status filter
  String get filterStatus {
    if (selectedDate.value != null) {
      final DateFormat format = DateFormat('dd MMMM yyyy', 'id_ID');
      return 'Laporan tanggal ${format.format(selectedDate.value!)}';
    }
    return selectedFilter.value == '7 Hari Terakhir'
        ? '7 hari terakhir'
        : 'Semua laporan';
  }
}
