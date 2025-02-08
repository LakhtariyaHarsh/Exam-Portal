import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost:5000/api",
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  // Add Authorization Token to Headers
  Future<Dio> getDioWithAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    _dio.options.headers["Authorization"] =
        token != null ? "Bearer $token" : null;
    return _dio;
  }

  // Login API Call
  Future<Response> login(String email, String password) async {
    try {
      Response response = await _dio
          .post("/users/login", data: {"email": email, "password": password});
      return response;
    } catch (e) {
      throw Exception("Login failed");
    }
  }

  // Register API Call
  Future<Response> register(String name, String email, String password) async {
    try {
      Response response = await _dio.post("/users/register",
          data: {"name": name, "email": email, "password": password});
      return response;
    } catch (e) {
      throw Exception("Registration failed");
    }
  }

  // Fetch Categories
  Future<List<dynamic>> getCategories() async {
    Response response = await _dio.get("/categories");
    return response.data;
  }

  // Fetch Exams with Pagination
  Future<Map<String, dynamic>> getExams(int page, int limit) async {
    try {
      Response response = await _dio.get("/exams", queryParameters: {
        "page": page,
        "limit": limit,
      });

      if (response.statusCode == 200) {
        print("API Response: ${response.data}");

        return {
          "exams": (response.data["exams"] as List)
              .map((exam) => exam['name'].toString())
              .toList(),
          "totalPages": response.data["totalPages"]
        };
      } else {
        throw Exception("Failed to load exams");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // Fetch exams with last date for available form (sorted by lastDateToApply)
  Future<Map<String, dynamic>> getExamsBylastDateToApply(int page, int limit) async {
    try {
      Response response = await _dio.get(
        "/exams/lastDateToApply",
        queryParameters: {
          "page": page,
          "limit": limit,
          "sort": "lastDateToApply" // Sort by lastDateToApply date
        },
      );

      if (response.statusCode == 200) {
        print("API Response: ${response.data}");

        return {
          "exams": (response.data["exams"] as List)
              .map((exam) => exam['name'].toString())
              .toList(),
          "totalPages": response.data["totalPages"]
        };
      } else {
        throw Exception("Failed to load exams");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // Fetch exams with admit card available (sorted by admitCardAvailable date)
  Future<Map<String, dynamic>> getExamsByAdmitCard(int page, int limit) async {
    try {
      Response response = await _dio.get(
        "/exams/admit-card",
        queryParameters: {
          "page": page,
          "limit": limit,
          "isadmitCardAvailable": true,
          "sort": "admitCardAvailable" // Sort by admitCardAvailable date
        },
      );

      if (response.statusCode == 200) {
        print("API Response: ${response.data}");

        return {
          "exams": (response.data["exams"] as List)
              .map((exam) => exam['name'].toString())
              .toList(),
          "totalPages": response.data["totalPages"]
        };
      } else {
        throw Exception("Failed to load exams");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

    // Fetch exams with admit card available (sorted by resultAvailable date)
  Future<Map<String, dynamic>> getExamsByResult(int page, int limit) async {
    try {
      Response response = await _dio.get(
        "/exams/result",
        queryParameters: {
          "page": page,
          "limit": limit,
          "resultAvailable": true,
          "sort": "resultPostingDate" // Sort by resultAvailable date
        },
      );

      if (response.statusCode == 200) {
        print("API Response: ${response.data}");

        return {
          "exams": (response.data["exams"] as List)
              .map((exam) => exam['name'].toString())
              .toList(),
          "totalPages": response.data["totalPages"]
        };
      } else {
        throw Exception("Failed to load exams");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

    // Fetch exams with syllabus available (sorted by syllabusAvailable date)
  Future<Map<String, dynamic>> getExamsBysyllabus(int page, int limit) async {
    try {
      Response response = await _dio.get(
        "/exams/syllabus",
        queryParameters: {
          "page": page,
          "limit": limit,
          "syllabusAvailable": true,
          "sort": "syllabusAvailableDate" // Sort by syllabusAvailable date
        },
      );

      if (response.statusCode == 200) {
        print("API Response: ${response.data}");

        return {
          "exams": (response.data["exams"] as List)
              .map((exam) => exam['name'].toString())
              .toList(),
          "totalPages": response.data["totalPages"]
        };
      } else {
        throw Exception("Failed to load exams");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

    // Fetch exams with AnswerKey available (sorted by resultAvailable date)
  Future<Map<String, dynamic>> getExamsByAnswerKey(int page, int limit) async {
    try {
      Response response = await _dio.get(
        "/exams/answerkey",
        queryParameters: {
          "page": page,
          "limit": limit,
          "isanswerKeyAvailable": true,
          "sort": "answerKeyAvailable" // Sort by resultAvailable date
        },
      );

      if (response.statusCode == 200) {
        print("API Response: ${response.data}");

        return {
          "exams": (response.data["exams"] as List)
              .map((exam) => exam['name'].toString())
              .toList(),
          "totalPages": response.data["totalPages"]
        };
      } else {
        throw Exception("Failed to load exams");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // Fetch Eligibility Criteria
  Future<List<dynamic>> getEligibility() async {
    Response response = await _dio.get("/eligibility");
    return response.data;
  }

  // Fetch Posts
  Future<List<dynamic>> getPosts() async {
    Response response = await _dio.get("/posts");
    return response.data;
  }
}
