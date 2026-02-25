import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  final Function(String) onNavigate;

  const MoreScreen({Key? key, required this.onNavigate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              
              // Profile Section
              Column(
                children: [
                  Container(
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFFFB6C1), width: 4),
                      color: const Color(0xFFFFE8F0),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 64,
                      color: Color(0xFFFFB6C1),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Ruchita',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              
              // Stats Cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        Icons.favorite,
                        'Heart rate',
                        '215bpm',
                        const Color(0xFFFFB6C1),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        Icons.local_fire_department,
                        'Calories',
                        '756cal',
                        const Color(0xFFFFB6C1),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        Icons.monitor_weight,
                        'Weight',
                        '103lbs',
                        const Color(0xFFFFB6C1),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              
              // Menu Items
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    _buildMenuItem(
                      Icons.people,
                      'Partner & Family Access',
                      'Share your journey',
                      () => onNavigate('partner'),
                    ),
                    _buildDivider(),
                    _buildMenuItem(
                      Icons.phone,
                      'Emergency Contacts',
                      'Manage emergency contacts',
                      () => onNavigate('emergency'),
                    ),
                    _buildDivider(),
                    _buildMenuItem(
                      Icons.shield,
                      'Privacy & Security',
                      'Data protection settings',
                      () => onNavigate('privacy'),
                    ),
                    _buildDivider(),
                    _buildMenuItem(
                      Icons.settings,
                      'App Settings',
                      'Customize your experience',
                      () => onNavigate('settings'),
                    ),
                    _buildDivider(),
                    _buildMenuItem(
                      Icons.help,
                      'Help Centre',
                      'Get support & FAQs',
                      () {},
                    ),
                    _buildDivider(),
                    _buildMenuItem(
                      Icons.info,
                      'About',
                      'App version & info',
                      () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(IconData icon, String label, String value, Color color) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: const Color(0xFFFFE8F0),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFFFB6C1), size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, thickness: 1, color: Color(0xFFF0F0F0));
  }
}
