
import 'package:felpus/models/pet_model.dart';


class ChatDataModel {
  final String id;
  final String chat;
  final String text;
  final PetModel pet;
  final String helpType;
  final Sender sender;
  final String createdAt;  // Kept as String
  final String updatedAt;  // Kept as String

  ChatDataModel({
    this.id = '',
    this.chat = '',
    this.text = '',
    PetModel? pet,
    this.helpType = '',
    Sender? sender,
    String? createdAt,
    String? updatedAt,
  })  : pet = pet ?? PetModel(),
        sender = sender ?? Sender(),
        createdAt = createdAt ?? DateTime.now().toIso8601String(),
        updatedAt = updatedAt ?? DateTime.now().toIso8601String();

  factory ChatDataModel.fromJson(Map<String, dynamic> json) {
    return ChatDataModel(
      id: json['_id'] ?? '',
      chat: json['chat'] ?? '',
      text: json['text'] ?? '',
      pet: json['pet'] != null ? PetModel.fromJson(json['pet']) : PetModel(),
      helpType: json['helpType'] ?? '',
      sender: json['sender'] != null ? Sender.fromJson(json['sender']) : Sender(),
      createdAt: json['createdAt'] ?? DateTime.now().toIso8601String(),
      updatedAt: json['updatedAt'] ?? DateTime.now().toIso8601String(),
    );
  }
}


class Sender {
  final String id;
  final String fullName;
  final String email;
  final String role;
  final String photo;
  final String isOnline;
  final String isDelete;
  final String isBlock;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String address;
  final String phone;

  Sender({
    this.id = '',
    this.fullName = '',
    this.email = '',
    this.role = '',
    this.photo = '',
    this.isOnline = '',
    this.isDelete = '',
    this.isBlock = '',
    DateTime? createdAt,
    DateTime? updatedAt,
    this.address = '',
    this.phone = '',
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      photo: json['photo'] ?? '',
      isOnline: json['isOnline'] ?? '',
      isDelete: json['isDelete'] ?? '',
      isBlock: json['isBlock'] ?? '',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : DateTime.now(),
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}

class PetModel {
  final String id;
  final String userId;
  final String forPets;
  final String petType;
  final String photo;
  final String color;
  final String petName;
  final String age;
  final String breed;
  final String sex;
  final String address;
  final String description;
  final String isDelete;
  final String report;
  final DateTime createdAt;
  final DateTime updatedAt;

  PetModel({
    this.id = '',
    this.userId = '',
    this.forPets = '',
    this.petType = '',
    this.photo = '',
    this.color = '',
    this.petName = '',
    this.age = '',
    this.breed = '',
    this.sex = '',
    this.address = '',
    this.description = '',
    this.isDelete = '',
    this.report = '',
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      forPets: json['forPets'] ?? '',
      petType: json['petType'] ?? '',
      photo: json['photo'] ?? '',
      color: json['color'] ?? '',
      petName: json['petName'] ?? '',
      age: json['age'] ?? '',
      breed: json['breed'] ?? '',
      sex: json['sex'] ?? '',
      address: json['address'] ?? '',
      description: json['description'] ?? '',
      isDelete: json['isDelete'] ?? '',
      report: json['report'] ?? '',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : DateTime.now(),
    );
  }
}

class ChatInfo {
  final String name;
  final String photo;

  ChatInfo({
    this.name = 'Unknown',
    this.photo = '/uploads/default/profile.jpg',
  });

  factory ChatInfo.fromJson(Map<String, dynamic> json) {
    return ChatInfo(
      name: json['name'] ?? 'Unknown',
      photo: json['photo'] ?? '/uploads/default/profile.jpg',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'photo': photo,
    };
  }
}




