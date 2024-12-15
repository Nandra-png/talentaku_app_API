class UserModel {
  final int id;
  final String status;
  final String username;
  final String fullname;
  final String nomorInduk;
  final String address;
  String? _photo; // private field
  final String birthInformation;
  final List<String> roles;
  final List<String> grades;
  final String? token;
  final String? fcmToken;

  UserModel({
    required this.id,
    required this.status,
    required this.username,
    required this.fullname,
    required this.nomorInduk,
    required this.address,
    String? photo,
    required this.birthInformation,
    required this.roles,
    required this.grades,
    this.token,
    this.fcmToken,
  }) : _photo = photo;

  String? get photo => _photo;

  set photo(String? newPhoto) => _photo = newPhoto;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      status: json['status'],
      username: json['username'],
      fullname: json['fullname'],
      nomorInduk: json['nomor_induk'],
      address: json['address'],
      photo: json['photo'],
      birthInformation: json['birth_information'],
      roles: List<String>.from(json['roles']),
      grades: List<String>.from(json['grades']),
      token: json['token'],
      fcmToken: json['fcm_token'],
    );
  }
}
