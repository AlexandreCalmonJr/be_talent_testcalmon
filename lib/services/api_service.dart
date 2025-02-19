import 'package:dio/dio.dart';

import '../models/user_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost:3000", // Base URL da API local
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  Future<List<UserModel>> fetchUsers() async {
  try {
    final response = await _dio.get("/employees"); // Verifique se o endpoint está correto

    if (response.statusCode == 200) {
      return (response.data as List).map((user) {
        return UserModel(
          id: user['id'] ?? 'ID não disponível',
          name: user['name'] ?? 'Nome não disponível',
          email: user['email'] ?? 'Email não informado',
          phone: user['phone'] ?? 'Telefone não informado',
          job: user['job'] ?? 'Cargo não informado',
          admissionDate: user['admission_date'] ?? '',
          image: (user['image']?.isNotEmpty == true) ? user['image'] : "https://via.placeholder.com/150",
        );
      }).toList();
    } else {
      throw Exception("Erro na API: Código ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Erro ao buscar funcionários: $e");
  }
}

}
