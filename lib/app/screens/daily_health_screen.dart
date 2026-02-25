import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class DailyHealthScreen extends StatefulWidget {
  const DailyHealthScreen({Key? key}) : super(key: key);

  @override
  State<DailyHealthScreen> createState() => _DailyHealthScreenState();
}

class _DailyHealthScreenState extends State<DailyHealthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Health'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Pregnancy Week Info
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Week 24 of Pregnancy',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Due Date: May 15, 2026',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      LinearProgressIndicator(
                        value: 0.6,
                        minHeight: 8,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '168 days remaining',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Health Metrics
              Text(
                'Today\'s Metrics',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  _buildMetricCard(
                    context,
                    'Blood Pressure',
                    '120/80',
                    'mmHg',
                    Icons.favorite,
                    AppTheme.primaryColor,
                  ),
                  _buildMetricCard(
                    context,
                    'Heart Rate',
                    '72',
                    'bpm',
                    Icons.favorite,
                    AppTheme.secondaryColor,
                  ),
                  _buildMetricCard(
                    context,
                    'Temperature',
                    '37.2',
                    '°C',
                    Icons.thermostat,
                    AppTheme.warningColor,
                  ),
                  _buildMetricCard(
                    context,
                    'Blood Glucose',
                    '95',
                    'mg/dL',
                    Icons.bloodtype,
                    AppTheme.successColor,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Wellness Activities
              Text(
                'Wellness Activities',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildWellnessItem('Steps', '4,532', '8,000 steps'),
                      const Divider(),
                      _buildWellnessItem('Water Intake', '1.5', '2 liters'),
                      const Divider(),
                      _buildWellnessItem('Sleep', '7 hrs', '8 hrs target'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Health Reading',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMetricCard(
    BuildContext context,
    String label,
    String value,
    String unit,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              unit,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWellnessItem(String title, String value, String target) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                target,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
              color: AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
