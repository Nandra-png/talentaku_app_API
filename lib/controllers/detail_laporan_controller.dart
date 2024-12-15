import 'package:get/get.dart';
import 'package:talentaku_app/models/detail_laporan_event.dart';

import '../apimodels/student_models.dart';
import '../apiservice/api_service.dart';
import '../constants/app_colors.dart';

class DetailLaporanController extends GetxController {
  var isLoading = false.obs;
  var detailReport = Rxn<StudentReportData>();
  final RxList<LaporanSection> sections = <LaporanSection>[].obs;

  @override
  void onInit() {
    super.onInit();
    int reportId = Get.arguments['id'] ?? 0;
    if (reportId > 0) {
      fetchReport(reportId);
    }
  }

  // Fetch detail report
  void fetchReport(int reportId) async {
    try {
      isLoading(true);
      final apiService = ApiService();
      final report = await apiService.fetchDetailReport(reportId);
      detailReport.value = report;
      
      // Convert report data to sections
      sections.value = [
        LaporanSection(
          title: 'Kegiatan Awal di Halaman',
          content: 'Kegiatan: ${report.kegiatanAwalDihalaman.join(", ")}\nHasil: ${report.dihalamanHasil}',
          isExpanded: false,
        ),
        LaporanSection(
          title: 'Kegiatan Awal Berdoa',
          content: 'Kegiatan: ${report.kegiatanAwalBerdoa.join(", ")}\nHasil: ${report.berdoaHasil}',
          isExpanded: false,
        ),
        LaporanSection(
          title: 'Kegiatan Inti 1',
          content: 'Kegiatan: ${report.kegiatanIntiSatu.join(", ")}\nHasil: ${report.intiSatuHasil}',
          isExpanded: false,
        ),
        LaporanSection(
          title: 'Kegiatan Inti 2',
          content: 'Kegiatan: ${report.kegiatanIntiDua.join(", ")}\nHasil: ${report.intiDuaHasil}',
          isExpanded: false,
        ),
        LaporanSection(
          title: 'Kegiatan Inti 3',
          content: 'Kegiatan: ${report.kegiatanIntiTiga.join(", ")}\nHasil: ${report.intiTigaHasil}',
          isExpanded: false,
        ),
        LaporanSection(
          title: 'Snack Time',
          content: report.snack.join(", "),
          isExpanded: false,
        ),
        LaporanSection(
          title: 'Kegiatan Inklusi',
          content: 'Kegiatan: ${report.inklusi.join(", ")}\nHasil: ${report.inklusiHasil}',
          isExpanded: false,
        ),
        LaporanSection(
          title: 'Kegiatan Inklusi Penutup',
          content: 'Kegiatan: ${report.inklusiPenutup.join(", ")}\nHasil: ${report.inklusiPenutupHasil}',
          isExpanded: false,
        ),
        LaporanSection(
          title: 'Doa Penutup',
          content: 'Doa: ${report.inklusiDoa.join(", ")}\nHasil: ${report.inklusiDoaHasil}',
          isExpanded: false,
        ),
        LaporanSection(
          title: 'Catatan',
          content: report.catatan.join(", "),
          isExpanded: false,
        ),
      ];
    } catch (e) {
      print('Error fetching report details: $e');
      Get.snackbar(
        'Error',
        'Failed to load Report Details',
        backgroundColor: AppColors.error,
        colorText: AppColors.textLight,
      );
    } finally {
      isLoading(false);
    }
  }

  void toggleSection(int index) {
    if (index >= 0 && index < sections.length) {
      sections[index] = LaporanSection(
        title: sections[index].title,
        content: sections[index].content,
        isExpanded: !sections[index].isExpanded,
      );
      sections.refresh();
    }
  }
}
