import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  final TextEditingController sentMessageController = TextEditingController();
  final List<Map<String, dynamic>> _chatData = [
    {
      'isSentByUser': false,
      'time': '10:00',
      'message': 'Pagi, saya mau tanya sesuatu nih.',
    },
    {
      'time': '10:01',
      'profile':
          'https://img.icons8.com/?size=100&id=13314&format=png&color=000000',
      'message': 'Silahkan bertanya apa yang ingin kamu tanyakan.',
      'isSentByUser': true,
    },
  ];

  List<Map<String, dynamic>> get chatData => _chatData;

  void sendMessage() {
    if (sentMessageController.text.isEmpty) return;

    final newMessage = {
      'isSentByUser': true,
      'time': _getCurrentTime(),
      'message': sentMessageController.text,
      'profile': 'https://your-profile-image-url.com/avatar.png',
    };

    _chatData.add(newMessage);
    sentMessageController.clear();
    notifyListeners();
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return '${now.hour}:${now.minute.toString().padLeft(2, '0')}';
  }
}
