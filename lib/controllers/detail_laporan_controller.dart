import 'package:get/get.dart';
import 'package:talentaku_app/models/detail_laporan_event.dart';

class DetailLaporanController extends GetxController {
  final RxList<LaporanSection> sections = <LaporanSection>[].obs;

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

  void toggleSection(int index) {
    sections[index] = LaporanSection(
      title: sections[index].title,
      content: sections[index].content,
      isExpanded: !sections[index].isExpanded,
    );
    sections.refresh();
  }
}
