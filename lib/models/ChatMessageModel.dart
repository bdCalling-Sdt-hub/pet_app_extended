import 'package:felpus/models/pet_model.dart';

class ChatMessageModel {
  final String time;
  final String? icon;
  final String? helpType;
  final PetModel? pet;
  final String? text;
  final String? senderId;

  ChatMessageModel({
    required this.time,
    this.icon,
    this.helpType,
    this.pet,
    this.text,
    this.senderId,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      time: json['time'] ?? '',
      icon: json['icon'],
      helpType: json['helpType'],
      pet: json['pet'] != null ? PetModel.fromJson(json['pet']) : null,
      text: json['text'],
      senderId: json['senderId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'icon': icon,
      'helpType': helpType,
      'pet': pet?.toJson(),
      'text': text,
      'senderId': senderId,
    };
  }
}

