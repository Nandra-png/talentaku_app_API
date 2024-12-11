class UserModel {
  final int id;
  final String status;
  final String username;
  final String fullname;
  final String nomorInduk;
  final String address;
  String? _photo;  // private field
  final String birthInformation;
  final List<String> roles;
  final String grades;

  UserModel({
    required this.id,
    required this.status,
    required this.username,
    required this.fullname,
    required this.nomorInduk,
    required this.address,
    String? photo,  // photo parameter can be null
    required this.birthInformation,
    required this.roles,
    required this.grades,
  }) : _photo = photo;  // initialize _photo with the provided value

  String? get photo => _photo; // getter

  set photo(String? newPhoto) => _photo = newPhoto; // setter for photo

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
      grades: json['grades'],
    );
  }
}
