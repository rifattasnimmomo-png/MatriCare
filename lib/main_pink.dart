import 'package:flutter/material.dart';
import 'app/screens/home_dashboard_complete.dart';
import 'app/screens/alerts_screen_complete.dart';
import 'app/screens/daily_health_screen_complete.dart';
import 'app/screens/reports_screen_complete.dart';
import 'app/screens/onboarding_screen_complete.dart';

void main() {
  runApp(const MatriCareApp());
}

class MatriCareApp extends StatelessWidget {
  const MatriCareApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MatriCare',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFB6C1),
        useMaterial3: true,
      ),
      home: const MatriCareHome(),
    );
  }
}

class MatriCareHome extends StatefulWidget {
  const MatriCareHome({Key? key}) : super(key: key);

  @override
  State<MatriCareHome> createState() => _MatriCareHomeState();
}

class _MatriCareHomeState extends State<MatriCareHome> {
  int _currentIndex = 0;
  String _userName = 'Sarah';
  int _pregnancyWeek = 18;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeDashboardComplete(
        userName: _userName,
        pregnancyWeek: _pregnancyWeek,
      ),
      const AlertsScreenComplete(),
      const DailyHealthScreenComplete(),
      const ReportsScreenComplete(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        selectedItemColor: const Color(0xFFFFB6C1),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Alerts'),
          BottomNavigationBarItem(icon: Icon(Icons.health_and_safety), label: 'Health'),
          BottomNavigationBarItem(icon: Icon(Icons.description), label: 'Reports'),
        ],
      ),
    );
  }
}
