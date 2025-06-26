import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  final List<Map<String, String>> newsList = const [
    {
      'title': 'ALRC TV lance son nouveau journal',
      'content': 'Découvrez le JT d\'aujourd\'hui avec nos reportages exclusifs.',
    },
    {
      'title': 'Événement à venir',
      'content': 'Nous couvrirons en direct le prochain sommet des médias.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        final news = newsList[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(news['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(news['content']!),
          ),
        );
      },
    );
  }
}
