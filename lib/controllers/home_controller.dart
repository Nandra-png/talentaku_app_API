import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/apimodels/program_model.dart';
import 'package:talentaku_app/apimodels/student_models.dart';
import 'package:talentaku_app/apimodels/user_model.dart';
import 'package:talentaku_app/apiservice/api_service.dart';
import 'package:talentaku_app/models/broadcast_event.dart';
import 'package:talentaku_app/models/categories_event.dart';
import 'package:talentaku_app/models/class_event.dart';
import 'package:talentaku_app/models/laporan_preview_event.dart';
import 'package:talentaku_app/controllers/laporan_siswa_controller.dart';

class HomeController extends GetxController {
   late LaporanSiswaController laporanController;
  var informationList = <Program>[].obs;
  var isLoading = false.obs;
   var title = 'Laporan Harian'.obs;

   // Tambahkan variabel untuk menyimpan user
  var user = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    fetchInformation();
    fetchUserProfile(); // Tambahkan untuk fetch user profile
    if (!Get.isRegistered<LaporanSiswaController>()) {
      Get.put(LaporanSiswaController());
    }
  }

  // Fungsi untuk fetch informasi
  void fetchInformation() async {
    try {
      isLoading(true);
      final apiService = ApiService();
      final programs = await apiService.fetchPrograms();
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

  // Fungsi untuk fetch user profile
  void fetchUserProfile() async {
    try {
      isLoading(true);
      final userProfile = await ApiService.fetchUserProfile();
      user.value = userProfile; // Assign data ke variabel user
    } catch (e) {
      print('Error fetching user profile: $e');
      Get.snackbar(
        'Error',
        'Failed to load user profile',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  // Getter untuk mendapatkan username
String get userName => user.value?.username ?? 'Guest';
String get Roles {
  if (user.value?.roles.isNotEmpty ?? false) {
    return user.value!.roles.first; 
  }
  return 'Guest'; 
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
  List<Datum> get laporanPreviews {
    laporanController = Get.find<LaporanSiswaController>();
    // Mengambil 3 laporan terbaru dari LaporanSiswaController
    return laporanController.StudentReport.take(3).toList();
  }

}
