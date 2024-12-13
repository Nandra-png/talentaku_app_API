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
            status: '1',
          ),
          LaporanSection(
            title: 'Kegiatan Inti',
            content: [
              {
                'kegiatan': 'Pengenalan huruf vokal melalui kartu bergambar',
                'hasil': 'Siswa dapat mengenali dan menyebutkan huruf A, I, U, E, O'
              },
              {
                'kegiatan': 'Menghitung benda-benda di sekitar kelas',
                'hasil': 'Siswa mampu menghitung benda 1-5 dengan benar'
              },
              {
                'kegiatan': 'Mewarnai gambar sesuai contoh',
                'hasil': 'Siswa dapat mewarnai dengan rapi dalam garis'
              }
            ],
            isExpanded: false,
            status: '2',
          ),
          LaporanSection(
            title: 'Snack Time',
            content:
                'Menu snack: Buah-buahan segar (apel dan pisang). Siswa belajar tentang pentingnya mencuci tangan sebelum makan dan berbagi dengan teman.',
            isExpanded: false,
            status: '1',
          ),
          LaporanSection(
            title: 'Kegiatan Inklusi',
            content:
                'Kegiatan menggambar bersama dengan tema "Kebun Binatang". Semua siswa berpartisipasi aktif dan saling membantu dalam memilih warna.',
            isExpanded: false,
            status: '3',
          ),
          LaporanSection(
            title: 'Catatan Khusus',
            content:
                'Perkembangan motorik halus semakin membaik, terutama dalam memegang pensil dan menggunting. Beberapa siswa masih memerlukan bantuan dalam menulis huruf.',
            isExpanded: false,
            status: '1',
          ),
          LaporanSection(
            title: 'Unggah Foto',
            content: 'https://example.com/photos/activity1.jpg',
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
            status: '1',
          ),
          LaporanSection(
            title: 'Kegiatan Inti',
            content: [
              {
                'kegiatan': 'Pengenalan warna menggunakan balok-balok kayu',
                'hasil': 'Siswa berhasil mengelompokkan benda berdasarkan warna'
              },
              {
                'kegiatan': 'Menggambar bentuk geometri sederhana',
                'hasil': 'Siswa dapat menggambar lingkaran dan persegi'
              },
              {
                'kegiatan': 'Bermain puzzle bentuk',
                'hasil': 'Siswa mampu menyelesaikan puzzle sederhana'
              }
            ],
            isExpanded: false,
            status: '2',
          ),
          LaporanSection(
            title: 'Snack Time',
            content:
                'Menu snack: Roti dan susu. Siswa belajar tentang makanan sehat dan pentingnya sarapan. Semua siswa menghabiskan porsi mereka.',
            isExpanded: false,
            status: '1',
          ),
          LaporanSection(
            title: 'Kegiatan Inklusi',
            content:
                'Bermain peran dengan tema "Profesi". Siswa belajar tentang berbagai pekerjaan dan berinteraksi dengan baik dalam kelompok.',
            isExpanded: false,
            status: '3',
          ),
          LaporanSection(
            title: 'Catatan Khusus',
            content:
                'Interaksi sosial antar siswa semakin baik. Beberapa siswa yang sebelumnya pemalu mulai berani tampil di depan kelas.',
            isExpanded: false,
            status: '1',
          ),
          LaporanSection(
            title: 'Unggah Foto',
            content: 'https://example.com/photos/activity2.jpg',
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
            status: '1',
          ),
          LaporanSection(
            title: 'Kegiatan Inti',
            content: [
              {
                'kegiatan': 'Praktik memilah sampah organik dan non-organik',
                'hasil': 'Siswa dapat membedakan jenis sampah dengan benar'
              },
              {
                'kegiatan': 'Menanam bibit tanaman dalam pot',
                'hasil': 'Siswa antusias dalam kegiatan berkebun'
              },
              {
                'kegiatan': 'Membuat kreasi dari barang bekas',
                'hasil': 'Siswa berhasil membuat mainan dari botol bekas'
              }
            ],
            isExpanded: false,
            status: '2',
          ),
          LaporanSection(
            title: 'Snack Time',
            content:
                'Menu snack: Pudding dan biskuit. Siswa belajar untuk tidak membuang sampah sembarangan dan menjaga kebersihan meja makan.',
            isExpanded: false,
            status: '1',
          ),
          LaporanSection(
            title: 'Kegiatan Inklusi',
            content:
                'Kegiatan membersihkan kelas bersama. Semua siswa berpartisipasi dalam membersihkan dan merapikan kelas.',
            isExpanded: false,
            status: '3',
          ),
          LaporanSection(
            title: 'Catatan Khusus',
            content:
                'Perlu perhatian lebih pada fokus beberapa siswa saat kegiatan membaca. Namun secara keseluruhan, siswa menunjukkan semangat belajar yang baik.',
            isExpanded: false,
            status: '1',
          ),
          LaporanSection(
            title: 'Unggah Foto',
            content: 'https://example.com/photos/activity3.jpg',
            isExpanded: false,
          ),
        ];

      default:
        return [];
    }
  }

  void toggleExpansion(int index) {
    sections[index] = sections[index].copyWith(
      isExpanded: !sections[index].isExpanded,
    );
    sections.refresh();
  }
}
