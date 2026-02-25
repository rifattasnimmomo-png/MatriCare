import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports & Results'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recent Reports',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              _buildReportCard(
                context,
                'Ultrasound Scan Results',
                'Fetal Medicine',
                'Feb 18, 2026',
                'Dr. Michael Chen',
              ),
              const SizedBox(height: 12),
              _buildReportCard(
                context,
                'Blood Test Report',
                'Hematology',
                'Feb 15, 2026',
                'Dr. Sarah Johnson',
              ),
              const SizedBox(height: 12),
              _buildReportCard(
                context,
                'Glucose Tolerance Test',
                'Endocrinology',
                'Feb 10, 2026',
                'Dr. James Wilson',
              ),
              const SizedBox(height: 12),
              _buildReportCard(
                context,
                'First Trimester Screening',
                'Obstetrics',
                'Jan 20, 2026',
                'Dr. Emily Rodriguez',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReportCard(
    BuildContext context,
    String title,
    String type,
    String date,
    String doctorName,
  ) {
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
                        type,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.description,
                  color: AppTheme.primaryColor,
                  size: 28,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  doctorName,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: const Text('View Report'),
            ),
          ],
        ),
      ),
    );
  }
}
