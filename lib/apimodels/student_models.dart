import 'dart:convert';

StudentReport studentReportFromJson(String str) => StudentReport.fromJson(json.decode(str));

String studentReportToJson(StudentReport data) => json.encode(data.toJson());

class StudentReport {
  List<Datum> data;

  StudentReport({
    required this.data,
  });

  factory StudentReport.fromJson(Map<String, dynamic> json) => StudentReport(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  DateTime created;
  String semester;
  List<String> kegiatanAwalDihalaman;
  String dihalamanHasil;
  List<String> kegiatanAwalBerdoa;
  String berdoaHasil;
  List<String> kegiatanIntiSatu;
  String intiSatuHasil;
  List<String> kegiatanIntiDua;
  String intiDuaHasil;
  List<String> kegiatanIntiTiga;
  String intiTigaHasil;
  List<String> snack;
  List<String> inklusi;
  String inklusiHasil;
  List<String> inklusiPenutup;
  String inklusiPenutupHasil;
  List<String> inklusiDoa;
  String inklusiDoaHasil;
  List<String> catatan;
  int studentId;
  int teacherId;
  List<Media> media;

  Datum({
    required this.id,
    required this.created,
    required this.semester,
    required this.kegiatanAwalDihalaman,
    required this.dihalamanHasil,
    required this.kegiatanAwalBerdoa,
    required this.berdoaHasil,
    required this.kegiatanIntiSatu,
    required this.intiSatuHasil,
    required this.kegiatanIntiDua,
    required this.intiDuaHasil,
    required this.kegiatanIntiTiga,
    required this.intiTigaHasil,
    required this.snack,
    required this.inklusi,
    required this.inklusiHasil,
    required this.inklusiPenutup,
    required this.inklusiPenutupHasil,
    required this.inklusiDoa,
    required this.inklusiDoaHasil,
    required this.catatan,
    required this.studentId,
    required this.teacherId,
    required this.media,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'],
    created: DateTime.parse(json['created']),
    semester: json['semester'],
    kegiatanAwalDihalaman: List<String>.from(json['kegiatan_awal_dihalaman']),
    dihalamanHasil: json['dihalaman_hasil'],
    kegiatanAwalBerdoa: List<String>.from(json['kegiatan_awal_berdoa']),
    berdoaHasil: json['berdoa_hasil'],
    kegiatanIntiSatu: List<String>.from(json['kegiatan_inti_satu']),
    intiSatuHasil: json['inti_satu_hasil'],
    kegiatanIntiDua: List<String>.from(json['kegiatan_inti_dua']),
    intiDuaHasil: json['inti_dua_hasil'],
    kegiatanIntiTiga: List<String>.from(json['kegiatan_inti_tiga']),
    intiTigaHasil: json['inti_tiga_hasil'],
    snack: List<String>.from(json['snack']),
    inklusi: List<String>.from(json['inklusi']),
    inklusiHasil: json['inklusi_hasil'],
    inklusiPenutup: List<String>.from(json['inklusi_penutup']),
    inklusiPenutupHasil: json['inklusi_penutup_hasil'],
    inklusiDoa: List<String>.from(json['inklusi_doa']),
    inklusiDoaHasil: json['inklusi_doa_hasil'],
    catatan: List<String>.from(json['catatan']),
    studentId: json['student_id'],
    teacherId: json['teacher_id'],
    media: List<Media>.from(json['media'].map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created": "${created.year.toString().padLeft(4, '0')}-${created.month.toString().padLeft(2, '0')}-${created.day.toString().padLeft(2, '0')}",
    "semester": semester,
    "kegiatan_awal_dihalaman": List<dynamic>.from(kegiatanAwalDihalaman.map((x) => x)),
    "dihalaman_hasil": dihalamanHasil,
    "kegiatan_awal_berdoa": List<dynamic>.from(kegiatanAwalBerdoa.map((x) => x)),
    "berdoa_hasil": berdoaHasil,
    "kegiatan_inti_satu": List<dynamic>.from(kegiatanIntiSatu.map((x) => x)),
    "inti_satu_hasil": intiSatuHasil,
    "kegiatan_inti_dua": List<dynamic>.from(kegiatanIntiDua.map((x) => x)),
    "inti_dua_hasil": intiDuaHasil,
    "kegiatan_inti_tiga": List<dynamic>.from(kegiatanIntiTiga.map((x) => x)),
    "inti_tiga_hasil": intiTigaHasil,
    "snack": List<dynamic>.from(snack.map((x) => x)),
    "inklusi": List<dynamic>.from(inklusi.map((x) => x)),
    "inklusi_hasil": inklusiHasil,
    "inklusi_penutup": List<dynamic>.from(inklusiPenutup.map((x) => x)),
    "inklusi_penutup_hasil": inklusiPenutupHasil,
    "inklusi_doa": List<dynamic>.from(inklusiDoa.map((x) => x)),
    "inklusi_doa_hasil": inklusiDoaHasil,
    "catatan": List<dynamic>.from(catatan.map((x) => x)),
    "student_id": studentId,
    "teacher_id": teacherId,
    "media": List<dynamic>.from(media.map((x) => x.toJson())),
  };
}

class Media {
  int id;
  int reportId;
  String filePath;

  Media({
    required this.id,
    required this.reportId,
    required this.filePath,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    reportId: json["report_id"],
    filePath: json["file_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "report_id": reportId,
    "file_path": filePath,
  };
}