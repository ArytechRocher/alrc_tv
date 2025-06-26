import 'package:flutter/material.dart';
import 'video_player_widget.dart';

class VodScreen extends StatelessWidget {
  const VodScreen({super.key});

  final List<Map<String, String>> vodItems = const [
    {
      'title': 'Émission 1',
      'url': 'https://groupemedia.info/alrc_tv/videos/intro.mp4',
    },
    {
      'title': 'Émission 2',
      'url': 'https://groupemedia.info/alrc_tv/videos/intro.mp4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vodItems.length,
      itemBuilder: (context, index) {
        final item = vodItems[index];
        return Card(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(title: Text(item['title']!)),
              VideoPlayerWidget(videoUrl: item['url']!),
            ],
          ),
        );
      },
    );
  }
}
