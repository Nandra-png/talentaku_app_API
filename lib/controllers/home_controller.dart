import 'package:get/get.dart';
import 'package:talentaku_app/models/broadcast_event.dart';
import 'package:talentaku_app/models/categories_event.dart';
import 'package:talentaku_app/models/class_event.dart';
import 'package:talentaku_app/models/laporan_preview_event.dart';
import 'package:talentaku_app/controllers/laporan_siswa_controller.dart';

class HomeController extends GetxController {
  String userName = 'Khalisha';
  late LaporanSiswaController laporanController;

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

  @override
  void onInit() {
    super.onInit();
    // Memastikan LaporanSiswaController sudah diinisialisasi
    if (!Get.isRegistered<LaporanSiswaController>()) {
      Get.put(LaporanSiswaController());
    }
  }

  void updateUserName(String newName) {
    userName = newName;
    update();
  }
}
