import 'chat_data_model.dart';

class ChatMessageModel {
  final String chatId;
  final String time;
  final String helpType;
  final PetModel pet;
  final String text;
  final Sender sender;

  ChatMessageModel({
    required this.chatId,
    required this.time,
    this.helpType = "",
    PetModel? pet,
    this.text = "",
    Sender? sender,
  })  : pet = pet ?? PetModel(),
        sender = sender ?? Sender();

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      chatId: json['chatId'] ?? '',
      time: json['time'] ?? '',
      helpType: json['helpType'],
      pet: json['pet'] != null ? PetModel.fromJson(json['pet']) : null,
      text: json['text'],
      sender: json['senderId'] != null ? Sender.fromJson(json['sender']) : null,
    );
  }
}
