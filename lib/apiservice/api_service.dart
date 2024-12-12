import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talentaku_app/apimodels/program_model.dart';
import 'package:talentaku_app/apimodels/user_model.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';

class ApiService {
  static const String baseUrl = 'https://82bb-66-96-225-176.ngrok-free.app';
  static const String _tokenKey = 'auth_token';

  // Token management
  static Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  // Add authorization header
  static Future<Map<String, String>> _getHeaders() async {
    final token = await getToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // Login API
  static Future<Map<String, dynamic>> login(
      String username, String password) async {
    final url = Uri.parse('$baseUrl/api/v2/auth/login');
    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData['token'] != null) {
        // Store the token in SharedPreferences
        await setToken(responseData['token']);
      }
      return responseData;
    } else {
      throw Exception('Failed to login');
    }
  }

  // Upload Profile Photo API
  // static Future<Map<String, dynamic>> uploadProfilePhoto(File photo) async {
  //   final url = Uri.parse('$baseUrl/api/v2/user/update-photo');
  //   final headers = await _getHeaders();
  //   final request = http.MultipartRequest('POST', url)
  //     ..headers.addAll(headers)
  //     ..files.add(await http.MultipartFile.fromPath('photo', photo.path));
  //
  //   final response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     return jsonDecode(await response.stream.bytesToString());
  //   } else {
  //     throw Exception('Failed to upload photo');
  //   }
  // }

  static Future uploadProfilePhoto(
      {required File file,
        required String token}) async {
    var mimeType = lookupMimeType(file.path);
    var bytes = await File.fromUri(Uri.parse(file.path)).readAsBytes();
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    http.MultipartRequest request = new http.MultipartRequest(
        "POST",
        Uri.parse('$baseUrl/api/v2/user/update-photo'));

    http.MultipartFile multipartFile = await http.MultipartFile.fromBytes(
        'photo', bytes,
        filename: basename(file.path),
        contentType: MediaType.parse(mimeType.toString()));
    request.headers.addAll(headers);
    request.files.add(multipartFile);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      throw HttpException('request error code ${response.statusCode}');
    }
  }

  // Fetch Information API
  Future<List<Program>> fetchPrograms() async {
    final headers = await _getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/api/programs'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'] as List;
      return data.map((program) => Program.fromJson(program)).toList();
    } else {
      throw Exception('Failed to fetch programs');
    }
  }

  // Fetch user profile data
  static Future<UserModel> fetchUserProfile() async {
    final url = Uri.parse('$baseUrl/api/v2/user');
    final headers = await _getHeaders();
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      return UserModel.fromJson(data);
    } else {
      throw Exception('Failed to fetch user profile');
    }
  }
}
