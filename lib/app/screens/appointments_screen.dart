import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upcoming',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              _buildAppointmentCard(
                context,
                'Routine Checkup',
                'Dr. Sarah Johnson',
                'Obstetrics & Gynecology',
                'Tomorrow, 10:00 AM',
                'City Medical Hospital',
                AppTheme.primaryColor,
              ),
              const SizedBox(height: 12),
              _buildAppointmentCard(
                context,
                'Ultrasound Scan',
                'Dr. Michael Chen',
                'Fetal Medicine',
                'Mar 5, 2026, 2:00 PM',
                'Advanced Imaging Center',
                AppTheme.secondaryColor,
              ),
              const SizedBox(height: 20),
              Text(
                'Completed',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              _buildAppointmentCard(
                context,
                'First Trimester Screening',
                'Dr. Emily Rodriguez',
                'Obstetrics & Gynecology',
                'Feb 18, 2026, 11:00 AM',
                'City Medical Hospital',
                AppTheme.successColor,
                isCompleted: true,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Schedule Appointment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildAppointmentCard(
    BuildContext context,
    String title,
    String doctorName,
    String specialty,
    String dateTime,
    String location,
    Color color, {
    bool isCompleted = false,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                        doctorName,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.medical_services, color: color, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              specialty,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: AppTheme.textTertiary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    dateTime,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: AppTheme.textTertiary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    location,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            if (isCompleted) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.successColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Completed',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.successColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
