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
  final RxList<LaporanPreviewEvent> filteredLaporan = <LaporanPreviewEvent>[].obs;

  var studentReports = <StudentReportData>[].obs;
  var isLoading = false.obs;

  final List<String> filterOptions = [
    'Semua Laporan',
    '7 Hari Terakhir',
    'Pilih Tanggal',
  ];

  // Fetch student reports
  void fetchReport() async {
    try {
      isLoading(true);
      final apiService = ApiService();
      final report = await apiService.fetchStudentReport();
      studentReports.assignAll(report.data);
    } catch (e) {
      print('Error fetching reports: $e');
      Get.snackbar(
        'Error',
        'Failed to load Student Reports',
        backgroundColor: AppColors.error,
        colorText: AppColors.textLight,
      );
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchReport();
  }

  // Sort reports by date
  List<StudentReportData> _sortReportsByDate(List<StudentReportData> reports) {
    try {
      return List.from(reports)
        ..sort((a, b) {
          try {
            return DateTime.parse(b.created).compareTo(DateTime.parse(a.created));
          } catch (e) {
            print('Error parsing dates for sorting: ${a.created} or ${b.created}');
            return 0;
          }
        });
    } catch (e) {
      print('Error sorting reports: $e');
      return reports;
    }
  }

  // Filter reports
  void filterLaporan(String value) {
    selectedFilter.value = value;

    try {
      switch (value) {
        case '7 Hari Terakhir':
          final DateTime now = DateTime.now();
          final DateTime sevenDaysAgo = now.subtract(const Duration(days: 7));
          studentReports.value = _sortReportsByDate(
            studentReports.where((report) {
              try {
                return DateTime.parse(report.created).isAfter(sevenDaysAgo);
              } catch (e) {
                print('Error parsing date: ${report.created}');
                return false;
              }
            }).toList(),
          );
          break;

        case 'Pilih Tanggal':
          showDatePicker();
          break;

        default: // 'Semua Laporan'
          studentReports.value = _sortReportsByDate(studentReports);
      }
    } catch (e) {
      print('Error filtering reports: $e');
      Get.snackbar(
        'Error',
        'Failed to filter reports',
        backgroundColor: AppColors.error,
        colorText: AppColors.textLight,
      );
    }
  }

  // Show date picker
  void showDatePicker() async {
    try {
      final DateTime? picked = await DatePickerCard.show(
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime.now(),
        onDateSelected: (DateTime date) {
          selectedDate.value = date;
        },
      );

      if (picked != null) {
        final DateFormat format = DateFormat('yyyy-MM-dd');
        final String selectedDateStr = format.format(picked);

        studentReports.value = _sortReportsByDate(
          studentReports.where((report) {
            try {
              return report.created.startsWith(selectedDateStr);
            } catch (e) {
              print('Error filtering by date: ${report.created}');
              return false;
            }
          }).toList(),
        );
      }
    } catch (e) {
      print('Error showing date picker: $e');
      Get.snackbar(
        'Error',
        'Failed to show date picker',
        backgroundColor: AppColors.error,
        colorText: AppColors.textLight,
      );
    }
  }
}
