class Program {
  final int id;
  final String name;
  final List<String> desc;
  final String? photo;

  Program({
    required this.id,
    required this.name,
    required this.desc,
    this.photo,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'],
      name: json['name'],
      desc: List<String>.from(json['desc']),
      photo: json['photo'],
    );
  }
}
