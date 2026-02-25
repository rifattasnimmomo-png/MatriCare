import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({Key? key}) : super(key: key);

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerts & Notifications'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Critical',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              _buildAlertCard(
                context,
                'Elevated Blood Pressure',
                'Your blood pressure reading is 145/92 mmHg. Please contact your doctor.',
                'Today, 2:30 PM',
                AppTheme.errorColor,
                'critical',
              ),
              const SizedBox(height: 20),
              Text(
                'Warnings',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              _buildAlertCard(
                context,
                'Medication Reminder',
                'Time to take your prenatal vitamin for today.',
                'Today, 10:00 AM',
                AppTheme.warningColor,
                'warning',
              ),
              const SizedBox(height: 12),
              _buildAlertCard(
                context,
                'Upcoming Appointment',
                'You have an appointment with Dr. Johnson tomorrow at 10:00 AM.',
                'Yesterday',
                AppTheme.infoColor,
                'info',
              ),
              const SizedBox(height: 20),
              Text(
                'General',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              _buildAlertCard(
                context,
                'Health Milestone',
                'You\'ve reached week 24 of your pregnancy!',
                '2 days ago',
                AppTheme.successColor,
                'info',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlertCard(
    BuildContext context,
    String title,
    String message,
    String time,
    Color color,
    String severity,
  ) {
    IconData icon;
    switch (severity) {
      case 'critical':
        icon = Icons.error;
        break;
      case 'warning':
        icon = Icons.warning;
        break;
      default:
        icon = Icons.info;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        time,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
