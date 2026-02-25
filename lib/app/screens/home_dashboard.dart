import 'package:flutter/material.dart';
import '../data/pregnancy_week_insights.dart';

class HomeDashboard extends StatelessWidget {
  final Function(String)? onNavigate;
  final String userName;
  final int pregnancyWeek;

  const HomeDashboard({
    Key? key,
    this.onNavigate,
    required this.userName,
    required this.pregnancyWeek,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWeek = pregnancyWeek;
    final weekInsight = getWeekInsight(currentWeek);
    final weeksToGo = 40 - currentWeek;
    final progressPercentage = (currentWeek / 40) * 100;

    return Scaffold(
      body: Stack(
        children: [
          // Blue background curve
          Positioned(
            top: -100,
            left: 0,
            right: 0,
            child: Container(
              height: 380,
              decoration: const BoxDecoration(
                color: Color(0xFFFFB6C1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(34),
                  bottomRight: Radius.circular(34),
                ),
              ),
            ),
          ),

          // Content
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    
                    // Good Morning
                    const Text(
                      'Good Morning',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    
                    // Name
                    Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.6,
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Pregnancy Week Card
                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Pregnancy Week',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  border: Border.all(color: Colors.white, width: 1.5),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  '$currentWeek weeks',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          
                          // Progress Bar
                          Stack(
                            children: [
                              Container(
                                height: 11,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(5.5),
                                ),
                              ),
                              FractionallySizedBox(
                                widthFactor: currentWeek / 40,
                                child: Container(
                                  height: 11,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$weeksToGo weeks to go',
                            style: const TextStyle(
                              fontSize: 8,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    
                    // Health Overview Card
                    GestureDetector(
                      onTap: () {
                        if (onNavigate != null) {
                          onNavigate!('vitals');
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Health Overview',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.wifi, size: 13, color: Colors.grey[400]),
                                    const SizedBox(width: 8),
                                    Text(
                                      '2 min ago',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            
                            // Status Box
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE8F0),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFFFB6C1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'All vitals looking good',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Your health metrics are within normal range',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            
                            // Vital Signs
                            _buildVitalRow(Icons.favorite, 'Heart Rate', '72 bpm', 'Normal', const Color(0xFFFF383C)),
                            const SizedBox(height: 16),
                            _buildVitalRow(Icons.air, 'Blood Oxygen', '98%', 'Normal', const Color(0xFF0088FF)),
                            const SizedBox(height: 16),
                            _buildVitalRow(Icons.thermostat, 'Temperature', '36.8°C', 'Normal', const Color(0xFFFF8D28)),
                            const SizedBox(height: 16),
                            _buildVitalRow(Icons.water_drop, 'Blood Pressure', '120/80', 'Normal', const Color(0xFFCB30E0)),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Baby Development Card
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFFB6C1), Color(0xFFFF9BB5)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Your Baby This Week',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Size: ${weekInsight.babySize}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            weekInsight.babyDevelopment,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVitalRow(IconData icon, String label, String value, String status, Color color) {
    return Row(
      children: [
        Icon(icon, size: 12, color: color),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF4CAF50).withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            status,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF4CAF50),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
