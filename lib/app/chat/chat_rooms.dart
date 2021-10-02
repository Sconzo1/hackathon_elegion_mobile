import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class TelegramChatRooms extends ConsumerWidget {
  const TelegramChatRooms({
    Key? key,
    required this.title,
    required this.chatNames,
    required this.chatLinks,
  }): super(key: key);

  final String title;
  final List<String> chatNames;
  final List<String> chatLinks;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(this.title,
                  style:
                  TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
            ],
          ),
          ListTile(
              leading: Icon(Icons.send),
              title: Text(this.chatNames[0]),
              onTap: () async {
                String url = this.chatLinks[0];
                print("launchingUrl: $url");
                await canLaunch(url)
                    ? await launch(url)
                    : throw 'Could not launch $url';
              }
          ),
          ListTile(
              leading: Icon(Icons.send),
              title: Text(this.chatNames[1]),
              onTap: () async {
                String url = this.chatLinks[1];
                print("launchingUrl: $url");
                await canLaunch(url)
                    ? await launch(url)
                    : throw 'Could not launch $url';
              }
          ),

        ],
      ),
    );
  }



}