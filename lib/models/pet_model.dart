import 'user_model.dart';

class PetModel {
  final String id;
  final UserModel user;
  final String forPets;
  final String photo;
  final String age;
  final String breed;
  final String sex;
  final String address;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final String isDelete;

  PetModel({
    required this.id,
    required this.user,
    required this.forPets,
    required this.photo,
    required this.age,
    required this.breed,
    required this.sex,
    required this.address,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.isDelete,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['_id'] ?? '',
      user: UserModel.fromJson(json['userId'] ?? {}),
      forPets: json['forPets'] ?? '',
      photo: json['photo'] ?? '',
      age: json['age'] ?? "0",
      breed: json['breed'] ?? '',
      sex: json['sex'] ?? '',
      address: json['address'] ?? '',
      description: json['description'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
      version: json['__v'] ?? 0,
      isDelete: json['isDelete'] ?? 'no',
    );
  }
}
