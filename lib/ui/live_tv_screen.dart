import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import 'video_player_widget.dart';

class LiveTvScreen extends StatelessWidget {
  const LiveTvScreen({super.key});

  final String liveStreamUrl = 'https://groupemedia.info/alrc_tv/videos/intro.mp4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          /// 🎥 Sticky lecteur vidéo en SliverAppBar
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true, // Reste visible en haut quand on scroll
            expandedHeight: 220.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  VideoPlayerWidget(videoUrl: liveStreamUrl, autoPlay: true),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Image.network(
                      'https://groupemedia.info/alrc_tv/images/favicon.png',
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 📰 Bandeaux d'infos défilants avec étiquettes fixes
SliverToBoxAdapter(
  child: Column(
    children: [
      // 🔴 Bandeau INFOS
      SizedBox(
        height: 30,
        child: Row(
          children: [
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              child: const Text(
                'INFOS 📢',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color(0xFFFF0000),
                child: Marquee(
                  text: '🔴 Flash info : Lancement officiel de la chaîne ALRC TV – Suivez le direct 24h/24...',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  blankSpace: 50,
                  velocity: 50,
                ),
              ),
            ),
          ],
        ),
      ),

      // 🟡 Bandeau PROGRAMMES
      SizedBox(
        height: 25,
        child: Row(
          children: [
            Container(
              color: Colors.yellow[700],
              padding: const EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              child: const Text(
                'PROGRAMMES',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black,
                child: Marquee(
                  text: '📢 Prochaines émissions : Décryptage Politique • Culture & Société • Focus Éducation • JT Afrique...',
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                  blankSpace: 50,
                  velocity: 45,
                ),
              ),
            ),
          ],
        ),
      ),
	  // 🟦 Bienvenue + intro
const Padding(
  padding: EdgeInsets.all(16.0),
  child: Text(
    'Bienvenue sur ALRC TV',
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color(0xFF00AEEF), // Bleu ALRC
    ),
  ),
),
const Padding(
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  child: Text(
    'Regardez nos dernières émissions, JT en direct, documentaires, et plus encore !',
    style: TextStyle(color: Colors.black87),
  ),
),
const Divider(height: 30),

// 📰 À la Une
const Padding(
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  child: Text(
    'À la Une',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  ),
),
ListTile(
  leading: Icon(Icons.newspaper, color: Color(0xFFFF0000)),
  title: Text('JT Spécial Économie'),
  subtitle: Text('Édition du 22 juin 2025'),
  onTap: () {},
),
ListTile(
  leading: Icon(Icons.live_tv, color: Color(0xFFFF0000)),
  title: Text('Émission en direct : Débat politique'),
  subtitle: Text('Ce soir à 20h'),
),
ListTile(
  leading: Icon(Icons.calendar_month, color: Color(0xFFFF0000)),
  title: Text('Programme TV'),
  subtitle: Text('Voir le planning des prochaines diffusions'),
),

const Divider(height: 30),

// 🌟 Émissions recommandées
const Padding(
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  child: Text(
    'Émissions recommandées',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  ),
),
SizedBox(
  height: 160,
  child: ListView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
    children: [
      _buildRecommendedCard(
        imageUrl: 'https://groupemedia.info/alrc_tv/images/1.jpg',
        title: 'Regards Africains',
      ),
      const SizedBox(width: 10),
      _buildRecommendedCard(
        imageUrl: 'https://groupemedia.info/alrc_tv/images/2.jpg',
        title: 'Décryptage Politique',
      ),
      const SizedBox(width: 10),
      _buildRecommendedCard(
        imageUrl: 'https://groupemedia.info/alrc_tv/images/3.jpg',
        title: 'Culture & Société',
      ),
      const SizedBox(width: 10),
      _buildRecommendedCard(
        imageUrl: 'https://groupemedia.info/alrc_tv/images/4.jpg',
        title: 'Focus Éducation',
      ),
    ],
  ),
),

const SizedBox(height: 30),


      const SizedBox(height: 16),
    ],
  ),
),

        ],
      ),
    );
  }

  static Widget _buildRecommendedCard({required String imageUrl, required String title}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          color: Colors.black.withOpacity(0.6),
          padding: const EdgeInsets.all(5),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
