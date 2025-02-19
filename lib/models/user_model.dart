class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String job;
  final String admissionDate;
  final String image;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.job,
    required this.admissionDate,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      job: json['job'] ?? '',
      admissionDate: json['admission_date'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
