
import 'package:felpus/models/pet_model.dart';

class ChatDataModel {
  String id;
  String chat;
  String text;
  PetModel pet;
  String helpType;
  String sender;
  String createdAt;
  String updatedAt;
  int v;

  ChatDataModel({
    this.id = '',
    this.chat = '',
    this.text = '',
    PetModel? pet,
    this.helpType = '',
    this.sender = '',
    this.createdAt = '',
    this.updatedAt = '',
    this.v = 0,
  }) : pet = pet ?? PetModel();

  factory ChatDataModel.fromJson(Map<String, dynamic> json) {
    return ChatDataModel(
      id: json['_id'] ?? '',
      chat: json['chat'] ?? '',
      text: json['text'] ?? '',
      pet: json['pet'] != null ? PetModel.fromJson(json['pet']) : PetModel(),
      helpType: json['helpType'] ?? '',
      sender: json['sender'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'chat': chat,
      'text': text,
      'pet': pet.toJson(),
      'helpType': helpType,
      'sender': sender,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class PetModel {
  String id;
  String userId;
  String forPets;
  String petType;
  String photo;
  String color;
  String petName;
  String age;
  String breed;
  String sex;
  String weight;
  String address;
  String healthCondition;
  String neuter;
  String vaccine;
  String microchipNumber;
  String temper;
  String activityLevel;
  String behavior;
  String specialNeeds;
  String petHistory;
  String contactInformation;
  String description;
  String isDelete;
  String report;
  DateTime createdAt;
  DateTime updatedAt;

  PetModel({
    this.id = "",
    this.userId = "",
    this.forPets = "",
    this.petType = "",
    this.photo = "",
    this.color = "",
    this.petName = "",
    this.age = "",
    this.breed = "",
    this.sex = "",
    this.weight = "",
    this.address = "",
    this.healthCondition = "",
    this.neuter = "Yes",
    this.vaccine = "Yes",
    this.microchipNumber = "",
    this.temper = "",
    this.activityLevel = "",
    this.behavior = "",
    this.specialNeeds = "no",
    this.petHistory = "no",
    this.contactInformation = "",
    this.description = "",
    this.isDelete = "no",
    this.report = "pending",
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['_id'] ?? "",
      userId: json['userId'] ?? "",
      forPets: json['forPets'] ?? "",
      petType: json['petType'] ?? "",
      photo: json['photo'] ?? "",
      color: json['color'] ?? "",
      petName: json['petName'] ?? "",
      age: json['age'] ?? "",
      breed: json['breed'] ?? "",
      sex: json['sex'] ?? "",
      weight: json['weight'] ?? "",
      address: json['address'] ?? "",
      healthCondition: json['healthCondition'] ?? "",
      neuter: json['neuter'] ?? "Yes",
      vaccine: json['vaccine'] ?? "Yes",
      microchipNumber: json['microchipNumber'] ?? "",
      temper: json['temper'] ?? "",
      activityLevel: json['activityLevel'] ?? "",
      behavior: json['behavior'] ?? "",
      specialNeeds: json['specialNeeds'] ?? "no",
      petHistory: json['petHistory'] ?? "no",
      contactInformation: json['contactInformation'] ?? "",
      description: json['description'] ?? "",
      isDelete: json['isDelete'] ?? "no",
      report: json['report'] ?? "pending",
      createdAt: DateTime.tryParse(json['createdAt'] ?? "") ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? "") ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'forPets': forPets,
      'petType': petType,
      'photo': photo,
      'color': color,
      'petName': petName,
      'age': age,
      'breed': breed,
      'sex': sex,
      'weight': weight,
      'address': address,
      'healthCondition': healthCondition,
      'neuter': neuter,
      'vaccine': vaccine,
      'microchipNumber': microchipNumber,
      'temper': temper,
      'activityLevel': activityLevel,
      'behavior': behavior,
      'specialNeeds': specialNeeds,
      'petHistory': petHistory,
      'contactInformation': contactInformation,
      'description': description,
      'isDelete': isDelete,
      'report': report,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
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




