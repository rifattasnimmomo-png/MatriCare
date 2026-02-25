import 'package:flutter/material.dart';
import '../data/pregnancy_week_insights.dart';

class HomeDashboardComplete extends StatelessWidget {
  final VoidCallback? onNavigate;
  final String userName;
  final int pregnancyWeek;

  const HomeDashboardComplete({
    Key? key,
    this.onNavigate,
    required this.userName,
    required this.pregnancyWeek,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weekInsight = getWeekInsight(pregnancyWeek);
    final milestoneWeeks = getMilestoneWeeks(pregnancyWeek);
    final weeksToGo = 40 - pregnancyWeek;
    final progressPercentage = (pregnancyWeek / 40);

    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          // Blue curved background
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
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const SizedBox(height: 67),

                // Good Morning and Logo
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good Morning',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              userName,
                              style: const TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Pregnancy Week Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 74,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Stack(
                      children: [
                        // Pregnancy Week text
                        const Positioned(
                          left: 18,
                          top: 10,
                          child: Text(
                            'Pregnancy Week',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        // Progress bar background
                        Positioned(
                          left: 18,
                          right: 18,
                          top: 38,
                          child: Container(
                            height: 11,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                          ),
                        ),

                        // Progress bar fill
                        Positioned(
                          left: 18,
                          top: 38,
                          child: Container(
                            width: (MediaQuery.of(context).size.width - 68) * progressPercentage,
                            height: 11,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                          ),
                        ),

                        // Weeks badge
                        Positioned(
                          right: 18,
                          top: 10,
                          child: Container(
                            height: 20,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              border: Border.all(color: Colors.white, width: 1.5),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text(
                                '$pregnancyWeek weeks',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Weeks to go
                        Positioned(
                          left: 18,
                          bottom: 10,
                          child: Text(
                            '$weeksToGo weeks to go',
                            style: const TextStyle(
                              fontSize: 8,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                // Health Overview Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: GestureDetector(
                    onTap: onNavigate,
                    child: Container(
                      height: 314,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // Health Overview title
                          const Positioned(
                            left: 14,
                            top: 20,
                            child: Text(
                              'Health Overview',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          // Wifi icon
                          Positioned(
                            right: 76,
                            top: 21,
                            child: Icon(
                              Icons.wifi,
                              size: 13,
                              color: Colors.grey.shade400,
                            ),
                          ),

                          // 2 min ago
                          const Positioned(
                            right: 14,
                            top: 20,
                            child: Text(
                              '2 min ago',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFC0C0C0),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          // Blue status box
                          Positioned(
                            left: 17,
                            right: 17,
                            top: 58,
                            child: Container(
                              height: 91,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE8F0),
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),

                          // Activity icon circle
                          Positioned(
                            left: 26,
                            top: 85,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFB6C1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.favorite,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          // All vitals looking good
                          const Positioned(
                            left: 72,
                            top: 84,
                            child: Text(
                              'All vitals looking good',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          // Health metrics text
                          const Positioned(
                            left: 72,
                            top: 106,
                            right: 20,
                            child: Text(
                              'Your health metrics are within normal range',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ),

                          // Vital Signs
                          _buildVitalRow(context, 172, Icons.favorite, const Color(0xFFFFB6C1), 'Heart Rate', '72 bpm'),
                          _buildVitalRow(context, 206, Icons.water_drop, const Color(0xFFFFB6C1), 'Blood Oxygen', '98%'),
                          _buildVitalRow(context, 240, Icons.thermostat, const Color(0xFFFFB6C1), 'Temperature', '98.7° F'),
                          _buildVitalRow(context, 272, Icons.show_chart, const Color(0xFFFFB6C1), 'Blood Pressure', '118/76'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Food & Supplements Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: GestureDetector(
                    onTap: onNavigate,
                    child: Container(
                      height: 155,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          const Positioned(
                            left: 14,
                            top: 20,
                            child: Text(
                              'Food & Supplements',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          // Pills
                          Positioned(
                            left: 40,
                            top: 65,
                            child: Column(
                              children: [
                                Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFE8F0),
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: const Icon(
                                    Icons.medication,
                                    size: 28,
                                    color: Color(0xFFFFB6C1),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Pills',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Water
                          Positioned(
                            left: MediaQuery.of(context).size.width / 2 - 28,
                            top: 65,
                            child: Column(
                              children: [
                                Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFE8F0),
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: const Icon(
                                    Icons.water_drop,
                                    size: 28,
                                    color: Color(0xFFFFB6C1),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Water',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Meals
                          Positioned(
                            right: 40,
                            top: 65,
                            child: Column(
                              children: [
                                Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFE8F0),
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: const Icon(
                                    Icons.restaurant,
                                    size: 28,
                                    color: Color(0xFFFFB6C1),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Meals',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 34),

                // Pregnancy Timeline
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pregnancy Timeline',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: 1.0,
                        ),
                      ),
                      const SizedBox(height: 25),

                      Container(
                        height: 380,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            // Calendar icon
                            const Positioned(
                              left: 16,
                              top: 25,
                              child: Icon(
                                Icons.calendar_today,
                                size: 25,
                                color: Color(0xFFFFB6C1),
                              ),
                            ),

                            // Timeline content
                            Positioned(
                              left: 51,
                              top: 70,
                              right: 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Week $pregnancyWeek of 40',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    weekInsight.trimester == 1
                                        ? 'First Trimester'
                                        : weekInsight.trimester == 2
                                            ? 'Second Trimester'
                                            : 'Third Trimester',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Text(
                                    'Current Week',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    weekInsight.babyDevelopment,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    'Size: ${weekInsight.babySize}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  if (milestoneWeeks.isNotEmpty) ...[
                                    const SizedBox(height: 12),
                                    Text(
                                      'Week ${milestoneWeeks[0].week} (Milestone)',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      milestoneWeeks[0].milestone ?? '',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                  if (milestoneWeeks.length > 1) ...[
                                    const SizedBox(height: 12),
                                    Text(
                                      'Week ${milestoneWeeks[1].week} (Milestone)',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      milestoneWeeks[1].milestone ?? '',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),

                            // Timeline dots
                            Positioned(
                              left: 25,
                              top: 83,
                              child: Container(
                                width: 7,
                                height: 7,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFB6C1),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: const Color(0xFFFFB6C1)),
                                ),
                              ),
                            ),

                            // Vertical line
                            Positioned(
                              left: 28,
                              top: 92,
                              child: Container(
                                width: 1,
                                height: 33,
                                color: const Color(0xFFFFB6C1),
                              ),
                            ),

                            // Second dot
                            Positioned(
                              left: 25,
                              top: 154,
                              child: Container(
                                width: 7,
                                height: 7,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey.shade400),
                                ),
                              ),
                            ),

                            // Second line
                            Positioned(
                              left: 28,
                              top: 163,
                              child: Container(
                                width: 1,
                                height: 75,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 33),

                // Today's Health Tip
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFB6C1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.lightbulb,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Today\'s Health Tip',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              weekInsight.motherTips,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color(0xFF828282),
                              ),
                            ),
                          ],
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
        ],
      ),
    );
  }

  Widget _buildVitalRow(BuildContext context, double top, IconData icon, Color color, String label, String value) {
    return Positioned(
      left: 29,
      right: 14,
      top: top,
      child: Row(
        children: [
          Icon(icon, size: 11, color: color),
          const SizedBox(width: 15),
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
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 58),
          Container(
            width: 45,
            height: 10,
            decoration: BoxDecoration(
              color: const Color(0xFFFFB6C1),
              borderRadius: BorderRadius.circular(2),
            ),
            child: const Center(
              child: Text(
                'Normal',
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
