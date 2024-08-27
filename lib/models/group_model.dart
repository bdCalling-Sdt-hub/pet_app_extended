
class GroupModel {
  String id;
  List<String> participants;
  String status;
  List<String> seenBy;
  String type;
  String groupName;
  String photo;
  bool isDelete;
  DateTime createdAt;
  DateTime updatedAt;
  int version;

  GroupModel({
    this.id = '',
    this.participants = const [],
    this.status = 'active',
    this.seenBy = const [],
    this.type = 'group',
    this.groupName = '',
    this.photo = '',
    this.isDelete = false,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.version = 0,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      id: json['_id'] ?? '',
      participants: List<String>.from(json['participants'] ?? []),
      status: json['status'] ?? 'active',
      seenBy: List<String>.from(json['seenBy'] ?? []),
      type: json['type'] ?? 'group',
      groupName: json['groupName'] ?? '',
      photo: json['photo'] ?? '',
      isDelete: json['isDelete'] ?? false,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
      version: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'participants': participants,
      'status': status,
      'seenBy': seenBy,
      'type': type,
      'groupName': groupName,
      'photo': photo,
      'isDelete': isDelete,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}
