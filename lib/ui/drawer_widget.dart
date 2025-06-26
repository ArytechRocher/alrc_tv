import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final Function(String) onSelect;
  const DrawerWidget({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
  decoration: const BoxDecoration(color: Color(0xFFFF0000)),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.network(
        'https://groupemedia.info/alrc_tv/images/favicon.png',
        height: 50,
      ),
      const SizedBox(height: 10),
      const Text(
        'ALRC TV',
        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      ),
      const Text(
        'Menu principal',
        style: TextStyle(color: Colors.white70),
      ),
    ],
  ),
),
          ListTile(
            leading: const Icon(Icons.live_tv),
            title: const Text('Live'),
            onTap: () => onSelect('Live'),
          ),
          ListTile(
            leading: const Icon(Icons.video_library),
            title: const Text('VOD'),
            onTap: () => onSelect('VOD'),
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text('Journal'),
            onTap: () => onSelect('Journal'),
          ),
        ],
      ),
    );
  }
}
