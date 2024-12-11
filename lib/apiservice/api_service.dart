import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://70fb-103-118-96-6.ngrok-free.app';

  // Login API
  static Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/api/v2/auth/login');
    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  // Upload Profile Photo API
  static Future<Map<String, dynamic>> uploadProfilePhoto(File photo) async {
    final url = Uri.parse('$baseUrl/api/v2/user/update-photo'); 
    final request = http.MultipartRequest('POST', url)
      ..files.add(await http.MultipartFile.fromPath('photo', photo.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString());
    } else {
      throw Exception('Failed to upload photo');
    }
  }
}
