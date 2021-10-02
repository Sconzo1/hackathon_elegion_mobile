import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'chat_rooms.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(child: TelegramChatRooms(
            title: "Работа",
            chatNames: ["Мой офис", "Большой Босс"],
            chatLinks: [
              "https://t.me/leadersofdigital",
              "https://telegram.me/ryavorsky"
            ],
          )),
          Expanded(child: TelegramChatRooms(
            title: "Развлечения",
            chatNames: ["Антон Автомойка", "Качалка"],
            chatLinks: [
              "https://telegram.me/aiekseu",
              "https://telegram.me/M0n0Bot"
            ],
          )),
          Expanded(child: TelegramChatRooms(
            title: "Учеба",
            chatNames: ["личные Финансы", "Уроки релаксации"],
            chatLinks: [
              "https://telegram.me/M0n0Bot",
              "https://telegram.me/M0n0Bot"
            ],
          )),
        ],
      ),
    );
  }
}
