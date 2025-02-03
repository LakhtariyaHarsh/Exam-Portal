import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';

class UserRepository {
  final ApiService apiService = ApiService();

  Future<bool> login(String email, String password) async {
    try {
      Response response = await apiService.login(email, password);
      if (response.statusCode == 200) {
        final token = response.data["token"];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", token);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(String name, String email, String password) async {
    try {
      Response response = await apiService.register(name, email, password);
      return response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }
}
