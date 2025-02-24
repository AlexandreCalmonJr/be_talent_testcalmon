class UserModel {
  final String id;
  final String name;
  final String job;
  final DateTime admissionDate;
  final String phone;
  final String image;

  UserModel({
    required this.id,
    required this.name,
    required this.job,
    required this.admissionDate,
    required this.phone,
    required this.image,
  });

  // Método para formatar telefone
  static String formatPhone(String phone) {
    if (phone.length == 10) {
      return '(${phone.substring(0, 2)}) ${phone.substring(2, 6)}-${phone.substring(6)}';
    } else if (phone.length == 11) {
      return '(${phone.substring(0, 2)}) ${phone.substring(2, 7)}-${phone.substring(7)}';
    } else if (phone.length == 12) {
      return '+${phone.substring(0, 2)} (${phone.substring(2, 4)}) ${phone.substring(4, 8)}-${phone.substring(8)}';
    } else if (phone.length == 13) {
      return '+${phone.substring(0, 2)} (${phone.substring(2, 5)}) ${phone.substring(5, 9)}-${phone.substring(9)}';
    }
    return phone;
  }

  // Método para converter JSON em UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 'ID não disponível',
      name: json['name'] ?? 'Nome não disponível',
      job: json['job'] ?? 'Cargo não informado',
      admissionDate: json['admission_date'] != null
          ? DateTime.tryParse(json['admission_date']) ?? DateTime.now()
          : DateTime.now(),
      phone: formatPhone(
          json['phone'] ?? ''), // Aplica a formatação ao criar o modelo
      image: json['image']?.isNotEmpty == true
          ? json['image']
          : "https://via.placeholder.com/150",
    );
  }
}
