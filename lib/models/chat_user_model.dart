class ChatUserModel {
  final String id;
  final List<String> participants;
  final String status;
  final List<String> seenBy;
  final String type;
  final String groupName;
  final String photo;
  final String lastMessage;
  final bool isDelete;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final Partner partner;

  ChatUserModel({
    required this.id,
    required this.participants,
    required this.status,
    required this.seenBy,
    required this.type,
    required this.groupName,
    required this.photo,
    required this.lastMessage,
    required this.isDelete,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.partner,
  });

  factory ChatUserModel.fromJson(Map<String, dynamic> json) {
    return ChatUserModel(
      id: json['_id'] ?? '',
      participants: List<String>.from(json['participants'] ?? []),
      status: json['status'] ?? '',
      seenBy: List<String>.from(json['seenBy'] ?? []),
      type: json['type'] ?? '',
      groupName: json['groupName'] ?? '',
      photo: json['photo'] ?? '',
      lastMessage: json['lastMessage'] ?? '',
      isDelete: json['isDelete'] ?? false,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
      version: json['__v'] ?? 0,
      partner: Partner.fromJson(json['partner'] ?? {}),
    );
  }
}

class Partner {
  final String about;
  final String bio;
  final String id;
  final String fullName;
  final String phone;
  final String email;
  final String password;
  final String role;
  final String photo;
  final String isOnline;
  final String isDelete;
  final String isBlock;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  Partner({
    required this.about,
    required this.bio,
    required this.id,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.password,
    required this.role,
    required this.photo,
    required this.isOnline,
    required this.isDelete,
    required this.isBlock,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory Partner.fromJson(Map<String, dynamic> json) {
    return Partner(
      about: json['about'] ?? '',
      bio: json['bio'] ?? '',
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      role: json['role'] ?? '',
      photo: json['photo'] ?? '',
      isOnline: json['isOnline'] ?? '0',
      isDelete: json['isDelete'] ?? 'no',
      isBlock: json['isBlock'] ?? 'no',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
      version: json['__v'] ?? 0,
    );
  }
}
