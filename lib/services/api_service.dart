import 'package:be_talent_test/models/user_model.dart';
import 'package:dio/dio.dart';

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
      final response = await _dio.get("/employees");

      if (response.statusCode == 200) {
        return (response.data as List).map((user) {
          return UserModel(
            id: user['id'] ?? 'ID não disponível',
            name: user['name'] ?? 'Nome não disponível',
            phone: UserModel.formatPhone(
                user['phone'] ?? ''), // Aplica a formatação de telefone
            job: user['job'] ?? 'Cargo não informado',
            admissionDate: user['admission_date'] != null
                ? DateTime.tryParse(user['admission_date']) ??
                    DateTime.now() // Converte e evita erro de parsing
                : DateTime.now(),
            image: (user['image']?.isNotEmpty == true)
                ? user['image']
                : "https://via.placeholder.com/150",
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
