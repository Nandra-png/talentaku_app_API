import 'package:get/get.dart';
import 'package:talentaku_app/models/detail_laporan_event.dart';

import '../apimodels/student_models.dart';
import '../apiservice/api_service.dart';
import '../constants/app_colors.dart';

class DetailLaporanController extends GetxController {
  var isLoading = false.obs;
  final RxList<LaporanSection> sections = <LaporanSection>[].obs;
  final RxList<Datum> DetailReport = <Datum>[].obs;
  // var DetailReport = <Datum>[].obs;


  @override
  void onInit() {
    super.onInit();
    String laporanId = Get.arguments['id'] ?? 'laporan_1'; 
    sections.value = getLaporanById(laporanId);
  }

  List<LaporanSection> getLaporanById(String id) {
    switch (id) {
      case 'laporan_1':
        return [
          LaporanSection(
            title: 'Kegiatan Awal',
            content:
                'Siswa mengikuti senam pagi dengan penuh semangat. Setelah senam, dilakukan kegiatan circle time dimana setiap siswa berbagi cerita tentang hewan peliharaan mereka.',
            isExpanded: false,
          ),
          LaporanSection(
            title: 'Kegiatan Inti',
            content:
                'Fokus pembelajaran hari ini adalah pengenalan huruf dan angka melalui permainan interaktif. Siswa menunjukkan kemajuan dalam mengenali huruf vokal dan angka 1-5.',
            isExpanded: false,
          ),
          LaporanSection(
            title: 'Snack Time',
            content:
                'Menu snack: Buah-buahan segar (apel dan pisang). Siswa belajar tentang pentingnya mencuci tangan sebelum makan dan berbagi dengan teman.',
            isExpanded: false,
          ),
          LaporanSection(
            title: 'Kegiatan Inklusi',
            content:
                'Kegiatan menggambar bersama dengan tema "Kebun Binatang". Semua siswa berpartisipasi aktif dan saling membantu dalam memilih warna.',
            isExpanded: false,
          ),
          LaporanSection(
            title: 'Catatan Khusus',
            content:
                'Perkembangan motorik halus semakin membaik, terutama dalam memegang pensil dan menggunting. Beberapa siswa masih memerlukan bantuan dalam menulis huruf.',
            isExpanded: false,
          ),
        ];

      case 'laporan_2':
        return [
          LaporanSection(
            title: 'Kegiatan Awal',
            content:
                'Kegiatan dimulai dengan bernyanyi bersama dan gerakan sederhana. Siswa sangat antusias mengikuti gerakan dan menghafal lirik lagu baru.',
            isExpanded: false,
          ),
          LaporanSection(
            title: 'Kegiatan Inti',
            content:
                'Pembelajaran fokus pada pengenalan warna dan bentuk menggunakan balok-balok kayu. Siswa berhasil mengelompokkan benda berdasarkan warna dengan baik.',
            isExpanded: false,
          ),
          LaporanSection(
            title: 'Snack Time',
            content:
                'Menu snack: Roti dan susu. Siswa belajar tentang makanan sehat dan pentingnya sarapan. Semua siswa menghabiskan porsi mereka.',
            isExpanded: false,
          ),
          LaporanSection(
            title: 'Kegiatan Inklusi',
            content:
                'Bermain peran dengan tema "Profesi". Siswa belajar tentang berbagai pekerjaan dan berinteraksi dengan baik dalam kelompok.',
            isExpanded: false,
          ),
          LaporanSection(
            title: 'Catatan Khusus',
            content:
                'Interaksi sosial antar siswa semakin baik. Beberapa siswa yang sebelumnya pemalu mulai berani tampil di depan kelas.',
            isExpanded: false,
          ),
        ];

      case 'laporan_3':
        return [
          LaporanSection(
            title: 'Kegiatan Awal',
            content:
                'Upacara bendera mini dan pengenalan tema mingguan "Lingkungan Sekitar". Siswa memperhatikan dengan baik saat guru menjelaskan.',
            isExpanded: false,
          ),
          LaporanSection(
            title: 'Kegiatan Inti',
            content:
                'Pembelajaran tentang kebersihan lingkungan. Siswa melakukan praktik memilah sampah dan menanam bibit tanaman di pot kecil.',
            isExpanded: false,
          ),
          LaporanSection(
            title: 'Snack Time',
            content:
                'Menu snack: Pudding dan biskuit. Siswa belajar untuk tidak membuang sampah sembarangan dan menjaga kebersihan meja makan.',
            isExpanded: false,
          ),
          LaporanSection(
            title: 'Kegiatan Inklusi',
            content:
                'Kegiatan membersihkan kelas bersama. Semua siswa berpartisipasi dalam membersihkan dan merapikan kelas.',
            isExpanded: false,
          ),
          LaporanSection(
            title: 'Catatan Khusus',
            content:
                'Perlu perhatian lebih pada fokus beberapa siswa saat kegiatan membaca. Namun secara keseluruhan, siswa menunjukkan semangat belajar yang baik.',
            isExpanded: false,
          ),
        ];

      default:
        return [];
    }
  }

  // Fungsi untuk fetch student report
  void fetchReport() async {
    try {
      isLoading(true);
      final apiService = ApiService();
      final detail = await apiService.fetchStudentReport();
      DetailReport.assignAll(detail);
    } catch (e) {
      print('Error fetching programs: $e');
      Get.snackbar(
        'Error',
        'Failed to load Detail Report',
        backgroundColor: AppColors.error,
        colorText: AppColors.textLight,
      );
    } finally {
      isLoading(false);
    }
  }

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

  // void toggleSection(int index) {
  //   sections[index] = LaporanSection(
  //     title: sections[index].title,
  //     content: sections[index].content,
  //     isExpanded: !sections[index].isExpanded,
  //   );
  //   sections.refresh();
  // }

  void toggleSection(int index) {
    DetailReport[index] = Datum(
      id: 0,
      created: DateTime.now(),
      semester: 'Semester 1',
      kegiatanAwalDihalaman: [],
      dihalamanHasil: '',
      kegiatanAwalBerdoa: [],
      berdoaHasil: '',
      kegiatanIntiSatu: [],
      intiSatuHasil: '',
      kegiatanIntiDua: [],
      intiDuaHasil: '',
      kegiatanIntiTiga: [],
      intiTigaHasil: '',
      snack: [],
      inklusi: [],
      inklusiHasil: '',
      inklusiPenutup: [],
      inklusiPenutupHasil: '',
      inklusiDoa: [],
      inklusiDoaHasil: '',
      catatan: [],
      studentId: 0,
      teacherId: 0,
      media: [],
    );
    DetailReport.refresh();
  }

}
