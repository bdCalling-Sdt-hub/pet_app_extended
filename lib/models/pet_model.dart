import 'user_model.dart';

class PetModel {
  String id;
  UserModel? userId;
  String forPets;
  String photo;
  String petName;
  String age;
  String breed;
  String sex;
  String address;
  String description;
  String isDelete;
  String createdAt;
  String updatedAt;
  String report;
  String petType;
  String color;
  String weight;
  String microchipNumber;
  String healthCondition;
  String neuter;
  String vaccine;
  String temper;
  String activityLevel;
  String behavior;
  String specialNeeds;
  String petHistory;
  String contactInformation;

  PetModel({
    this.id = '',
    this.userId,
    this.forPets = '',
    this.photo = '',
    this.petName = '',
    this.age = '',
    this.breed = '',
    this.sex = '',
    this.address = '',
    this.description = '',
    this.isDelete = 'no',
    this.createdAt = '',
    this.updatedAt = '',
    this.report = '',
    this.petType = '',
    this.color = '',
    this.weight = '',
    this.microchipNumber = '',
    this.healthCondition = '',
    this.neuter = '',
    this.vaccine = '',
    this.temper = '',
    this.activityLevel = '',
    this.behavior = '',
    this.specialNeeds = '',
    this.petHistory = '',
    this.contactInformation = '',
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['_id'] ?? '',
      userId: json['userId'] != null ? UserModel.fromJson(json['userId']) : UserModel(),
      forPets: json['forPets'] ?? '',
      photo: json['photo'] ?? '',
      petName: json['petName'] ?? '',
      age: json['age'] ?? '',
      breed: json['breed'] ?? '',
      sex: json['sex'] ?? '',
      address: json['address'] ?? '',
      description: json['description'] ?? '',
      isDelete: json['isDelete'] ?? 'no',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      report: json['report'] ?? '',
      petType: json['petType'] ?? '',
      color: json['color'] ?? '',
      weight: json['weight'] ?? '',
      microchipNumber: json['microchipNumber'] ?? '',
      healthCondition: json['healthCondition'] ?? '',
      neuter: json['neuter'] ?? '',
      vaccine: json['vaccine'] ?? '',
      temper: json['temper'] ?? '',
      activityLevel: json['activityLevel'] ?? '',
      behavior: json['behavior'] ?? '',
      specialNeeds: json['specialNeeds'] ?? '',
      petHistory: json['petHistory'] ?? '',
      contactInformation: json['contactInformation'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId?.toJson(),
      'forPets': forPets,
      'photo': photo,
      'petName': petName,
      'age': age,
      'breed': breed,
      'sex': sex,
      'address': address,
      'description': description,
      'isDelete': isDelete,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'report': report,
      'petType': petType,
      'color': color,
      'weight': weight,
      'microchipNumber': microchipNumber,
      'healthCondition': healthCondition,
      'neuter': neuter,
      'vaccine': vaccine,
      'temper': temper,
      'activityLevel': activityLevel,
      'behavior': behavior,
      'specialNeeds': specialNeeds,
      'petHistory': petHistory,
      'contactInformation': contactInformation,
    };
  }
}

class UserModel {
  String about;
  String bio;
  String id;
  String email;
  String role;
  String photo;
  String isOnline;
  String isDelete;
  String isBlock;
  String createdAt;
  String updatedAt;
  String address;
  String dob;
  String fullName;
  String phone;

  UserModel({
    this.about = '',
    this.bio = '',
    this.id = '',
    this.email = '',
    this.role = '',
    this.photo = '',
    this.isOnline = '0',
    this.isDelete = 'no',
    this.isBlock = 'no',
    this.createdAt = '',
    this.updatedAt = '',
    this.address = '',
    this.dob = '',
    this.fullName = '',
    this.phone = '',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      about: json['about'] ?? '',
      bio: json['bio'] ?? '',
      id: json['_id'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      photo: json['photo'] ?? '',
      isOnline: json['isOnline'] ?? '0',
      isDelete: json['isDelete'] ?? 'no',
      isBlock: json['isBlock'] ?? 'no',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      address: json['address'] ?? '',
      dob: json['dob'] ?? '',
      fullName: json['fullName'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'about': about,
      'bio': bio,
      '_id': id,
      'email': email,
      'role': role,
      'photo': photo,
      'isOnline': isOnline,
      'isDelete': isDelete,
      'isBlock': isBlock,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'address': address,
      'dob': dob,
      'fullName': fullName,
      'phone': phone,
    };
  }
}
