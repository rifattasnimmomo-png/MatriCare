import 'package:flutter/material.dart';

class AlertsScreenComplete extends StatefulWidget {
  const AlertsScreenComplete({Key? key}) : super(key: key);

  @override
  State<AlertsScreenComplete> createState() => _AlertsScreenCompleteState();
}

class _AlertsScreenCompleteState extends State<AlertsScreenComplete> {
  final List<Map<String, dynamic>> _alerts = [
    {
      'id': '1',
      'severity': 'attention',
      'title': 'Heart Rate Elevated',
      'message': 'Your heart rate has been slightly elevated (avg 92 bpm) over the past 2 hours. This could be normal, but we recommend resting and staying hydrated.',
      'time': '15 minutes ago',
      'action': 'Log Rest Period',
      'dismissed': false,
    },
    {
      'id': '2',
      'severity': 'monitor',
      'title': 'Hydration Reminder',
      'message': 'You\'ve only logged 4 glasses of water today. Adequate hydration is important during pregnancy. Aim for 8-10 glasses daily.',
      'time': '1 hour ago',
      'action': 'Log Water',
      'dismissed': false,
    },
    {
      'id': '3',
      'severity': 'info',
      'title': 'Prenatal Vitamin Reminder',
      'message': 'Don\'t forget to take your prenatal vitamin with breakfast for optimal absorption.',
      'time': '2 hours ago',
      'action': null,
      'dismissed': false,
    },
  ];

  void _dismissAlert(String id) {
    setState(() {
      final index = _alerts.indexWhere((a) => a['id'] == id);
      if (index != -1) {
        _alerts[index]['dismissed'] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeAlerts = _alerts.where((a) => !a['dismissed']).length;
    final resolvedToday = _alerts.where((a) => a['dismissed']).length;

    return Container(
      color: Colors.grey.shade50,
      child: Column(
        children: [
          // Header
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFFFB6C1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Alerts & Notifications',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Stay informed about your health status',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),

          // Summary Cards
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFB6C1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '$resolvedToday',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Resolved Today',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFB6C1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.notifications_active,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '$activeAlerts',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Active Alerts',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Alerts List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const Text(
                  'Recent Alerts',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                ..._alerts.where((a) => !a['dismissed']).map((alert) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _buildAlertCard(
                      alert['severity'],
                      alert['title'],
                      alert['message'],
                      alert['time'],
                      alert['action'],
                      () => _dismissAlert(alert['id']),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertCard(
    String severity,
    String title,
    String message,
    String time,
    String? action,
    VoidCallback onDismiss,
  ) {
    final config = _getSeverityConfig(severity);

    return Container(
      decoration: BoxDecoration(
        color: config['bg'],
        border: Border.all(color: config['border']),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: config['iconBg'],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  config['icon'],
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: config['badgeBg'],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            config['badgeText'],
                            style: TextStyle(
                              fontSize: 11,
                              color: config['badgeText'] == 'Emergency' ? Colors.red.shade700 : const Color(0xFFFFB6C1),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      message,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onDismiss,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          if (action != null) ...[
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: severity == 'emergency' ? Colors.red.shade600 : const Color(0xFFFFB6C1),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(action),
            ),
          ],
          const SizedBox(height: 12),
          Text(
            time,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _getSeverityConfig(String severity) {
    switch (severity) {
      case 'info':
        return {
          'bg': const Color(0xFFFFE8F0),
          'border': const Color(0xFFFFD4E5),
          'icon': Icons.info,
          'iconBg': const Color(0xFFFFB6C1),
          'badgeBg': const Color(0xFFFFD4E5),
          'badgeText': 'Info',
        };
      case 'monitor':
        return {
          'bg': const Color(0xFFFFE8F0),
          'border': const Color(0xFFFFD4E5),
          'icon': Icons.notifications,
          'iconBg': const Color(0xFFFFB6C1),
          'badgeBg': const Color(0xFFFFD4E5),
          'badgeText': 'Monitor',
        };
      case 'attention':
        return {
          'bg': const Color(0xFFFFE8F0),
          'border': const Color(0xFFFFD4E5),
          'icon': Icons.warning,
          'iconBg': const Color(0xFFFFB6C1),
          'badgeBg': const Color(0xFFFFD4E5),
          'badgeText': 'Attention',
        };
      case 'emergency':
        return {
          'bg': Colors.red.shade50,
          'border': Colors.red.shade200,
          'icon': Icons.phone,
          'iconBg': const Color(0xFFFFB6C1),
          'badgeBg': Colors.red.shade100,
          'badgeText': 'Emergency',
        };
      default:
        return {
          'bg': Colors.grey.shade50,
          'border': Colors.grey.shade200,
          'icon': Icons.info,
          'iconBg': const Color(0xFFFFB6C1),
          'badgeBg': Colors.grey.shade100,
          'badgeText': 'Info',
        };
    }
  }
}
