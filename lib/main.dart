import 'package:flutter/material.dart';
import 'package:alrc_tv_app/ui/live_tv_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ALRC TV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF0000), // Rouge ALRC
          primary: const Color(0xFFFF0000),
          secondary: const Color.fromARGB(255, 239, 195, 0), // Bleu ALRC
          background: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFF0000),
          foregroundColor: Colors.white,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      home: const MyHomePage(title: 'ALRC TV - Accueil'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedScreen = 'Accueil';

  Widget _getBody() {
    switch (_selectedScreen) {
      case 'Live':
        return const LiveTvScreen();
      case 'VOD':
        return const Center(child: Text("📺 Vidéos à la demande"));
      case 'Journal':
        return const Center(child: Text("📰 Journal télévisé"));
      default:
        return const LiveTvScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFFF0000)),
              child: Text(
                'Menu Principal',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Accueil'),
              onTap: () => _selectScreen('Accueil'),
            ),
            ListTile(
              leading: const Icon(Icons.live_tv),
              title: const Text('Live'),
              onTap: () => _selectScreen('Live'),
            ),
            ListTile(
              leading: const Icon(Icons.video_library),
              title: const Text('VOD'),
              onTap: () => _selectScreen('VOD'),
            ),
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Journal'),
              onTap: () => _selectScreen('Journal'),
            ),
          ],
        ),
      ),
      body: _getBody(),
    );
  }

  void _selectScreen(String screen) {
    setState(() {
      _selectedScreen = screen;
    });
    Navigator.pop(context);
  }
}
