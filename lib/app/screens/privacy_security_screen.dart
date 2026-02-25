import 'package:flutter/material.dart';

class PrivacySecurityScreen extends StatelessWidget {
  const PrivacySecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const SizedBox(height: 20),
          const Icon(Icons.shield, size: 80, color: Color(0xFFFFB6C1)),
          const SizedBox(height: 24),
          const Text(
            'Privacy & Security',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          _buildOption('Data Encryption', 'Your data is encrypted end-to-end', true),
          _buildOption('Biometric Lock', 'Use fingerprint or face ID', false),
          _buildOption('Auto-Lock', 'Lock app after inactivity', true),
          _buildOption('Share Analytics', 'Help improve the app', false),
        ],
      ),
    );
  }

  Widget _buildOption(String title, String subtitle, bool value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: (val) {},
            activeColor: const Color(0xFFFFB6C1),
          ),
        ],
      ),
    );
  }
}
