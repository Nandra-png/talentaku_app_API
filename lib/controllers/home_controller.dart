import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/apimodels/program_model.dart';
import 'package:talentaku_app/apiservice/api_service.dart';
import 'package:talentaku_app/models/broadcast_event.dart';
import 'package:talentaku_app/models/categories_event.dart';
import 'package:talentaku_app/models/class_event.dart';
import 'package:talentaku_app/models/laporan_preview_event.dart';
import 'package:talentaku_app/controllers/laporan_siswa_controller.dart';

class HomeController extends GetxController {
  String userName = 'Khalisha';
  late LaporanSiswaController laporanController;
  var informationList = <Program>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchInformation();
    if (!Get.isRegistered<LaporanSiswaController>()) {
      Get.put(LaporanSiswaController());
    }
  }

  void fetchInformation() async {
    try {
      isLoading(true);
      // Create an instance of ApiService
      final apiService = ApiService();
      // Call fetchPrograms instead of fetchInformationList
      final programs = await apiService.fetchPrograms();
      // Directly assign the programs list
      informationList.assignAll(programs);
    } catch (e) {
      print('Error fetching programs: $e');
      Get.snackbar(
        'Error',
        'Failed to load programs',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  List<Event> events = [
    Event(name: 'Hari Kemerdekaan', date: '17 Agustus 2024'),
    Event(name: 'Upacara Hari Pahlawan', date: '10 November 2024'),
    Event(name: 'Hari guru', date: '25 November 2024'),
  ];

  List<CategoryEvent> categories = [
    CategoryEvent(
      title: 'Kelas Anda',
      image: 'images/boy1.png',
    ),
    CategoryEvent(
      title: 'Program Tambahan',
      image: 'images/boy2.png',
    ),
    CategoryEvent(
      title: 'Laporan Pembelajaran',
      image: 'images/boy1.png',
    ),
  ];

  List<ClassEvent> classEvents = [
    ClassEvent(
      groupName: 'Kelompok Pelangi',
      ageRange: '2 - 3 Tahun',
      image: 'images/abc.png',
    ),
  ];

  List<Map<String, String>> programDetails = [
    {
      'title': 'Terapi Wicara',
      'description': 'Lorem ipsum dolor sit amet...',
      'image': 'images/terapiwicara.png',
    },
    {
      'title': 'Terapi Wicara',
      'description': 'Lorem ipsum dolor sit amet...',
      'image': 'images/terapiwicara.png',
    },
    {
      'title': 'Terapi Wicara',
      'description': 'Lorem ipsum dolor sit amet...',
      'image': 'images/terapiwicara.png',
    },
    {
      'title': 'Terapi Wicara',
      'description': 'Lorem ipsum dolor sit amet...',
      'image': 'images/terapiwicara.png',
    },
  ];

  // Getter untuk mendapatkan 3 laporan terbaru
  List<LaporanPreviewEvent> get laporanPreviews {
    laporanController = Get.find<LaporanSiswaController>();
    // Mengambil 3 laporan terbaru dari LaporanSiswaController
    return laporanController.filteredLaporan.take(3).toList();
  }

  void updateUserName(String newName) {
    userName = newName;
    update();
  }
}
