import 'package:flutter/material.dart';
import 'live_tv_screen.dart';
import 'vod_screen.dart';
import 'news_screen.dart';
import 'drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedScreen = 'Live';

  Widget _getBody() {
    switch (_selectedScreen) {
      case 'Live':
        return const LiveTvScreen();
      case 'VOD':
        return const VodScreen();
      case 'Journal':
        return const NewsScreen();
      default:
        return const Center(child: Text('Écran non disponible'));
    }
  }

  void _onMenuSelect(String screen) {
    Navigator.pop(context); // Ferme le Drawer
    setState(() => _selectedScreen = screen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ALRC TV - $_selectedScreen')),
      drawer: DrawerWidget(onSelect: _onMenuSelect),
      body: _getBody(),
    );
  }
}
