class UserModel {
  final String id;
  final String about;
  final String bio;
  final String email;
  final String role;
  final String photo;
  final String isOnline;
  final String isDelete;
  final String isBlock;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String address;
  final String dob;
  final String fullName;
  final String phone;
  final int version;

  UserModel({
    required this.id,
    required this.about,
    required this.bio,
    required this.email,
    required this.role,
    required this.photo,
    required this.isOnline,
    required this.isDelete,
    required this.isBlock,
    required this.createdAt,
    required this.updatedAt,
    required this.address,
    required this.dob,
    required this.fullName,
    required this.phone,
    required this.version,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      about: json['about'] ?? '',
      bio: json['bio'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      photo: json['photo'] ?? '',
      isOnline: json['isOnline'] ?? '0',
      isDelete: json['isDelete'] ?? 'no',
      isBlock: json['isBlock'] ?? 'no',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
      address: json['address'] ?? '',
      dob: json['dob'] ?? '',
      fullName: json['fullName'] ?? '',
      phone: json['phone'] ?? '',
      version: json['__v'] ?? 0,
    );
  }
}
