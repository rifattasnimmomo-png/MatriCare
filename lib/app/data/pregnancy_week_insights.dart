class PregnancyWeekInsight {
  final int week;
  final int trimester;
  final String babySize;
  final String babyDevelopment;
  final String motherTips;
  final String? milestone;

  PregnancyWeekInsight({
    required this.week,
    required this.trimester,
    required this.babySize,
    required this.babyDevelopment,
    required this.motherTips,
    this.milestone,
  });
}

final List<PregnancyWeekInsight> pregnancyWeekInsights = [
  // First Trimester (1-12)
  PregnancyWeekInsight(week: 1, trimester: 1, babySize: "smaller than a seed", babyDevelopment: "Conception begins", motherTips: "Take prenatal vitamins with folic acid"),
  PregnancyWeekInsight(week: 2, trimester: 1, babySize: "smaller than a seed", babyDevelopment: "Fertilization occurs", motherTips: "Continue folic acid supplementation"),
  PregnancyWeekInsight(week: 3, trimester: 1, babySize: "poppy seed", babyDevelopment: "Embryo implants in uterus", motherTips: "Avoid alcohol and smoking"),
  PregnancyWeekInsight(week: 4, trimester: 1, babySize: "poppy seed", babyDevelopment: "Embryo dividing rapidly", motherTips: "You might miss your period this week"),
  PregnancyWeekInsight(week: 5, trimester: 1, babySize: "sesame seed", babyDevelopment: "Heart begins to form", motherTips: "Schedule your first prenatal appointment"),
  PregnancyWeekInsight(week: 6, trimester: 1, babySize: "lentil", babyDevelopment: "Heart starts beating", motherTips: "Morning sickness may begin"),
  PregnancyWeekInsight(week: 7, trimester: 1, babySize: "blueberry", babyDevelopment: "Brain developing rapidly", motherTips: "Eat small, frequent meals to manage nausea"),
  PregnancyWeekInsight(week: 8, trimester: 1, babySize: "kidney bean", babyDevelopment: "Fingers and toes forming", motherTips: "Stay hydrated, rest when needed"),
  PregnancyWeekInsight(week: 9, trimester: 1, babySize: "grape", babyDevelopment: "All essential organs forming", motherTips: "Fatigue is normal, get plenty of rest"),
  PregnancyWeekInsight(week: 10, trimester: 1, babySize: "kumquat", babyDevelopment: "Vital organs functioning", motherTips: "Your baby can now swallow"),
  PregnancyWeekInsight(week: 11, trimester: 1, babySize: "fig", babyDevelopment: "Baby starts moving", motherTips: "Energy levels may start improving"),
  PregnancyWeekInsight(week: 12, trimester: 1, babySize: "lime", babyDevelopment: "Reflexes developing", motherTips: "First trimester is almost complete!", milestone: "End of first trimester"),
  
  // Second Trimester (13-26)
  PregnancyWeekInsight(week: 13, trimester: 2, babySize: "peapod", babyDevelopment: "Fingerprints forming", motherTips: "Welcome to second trimester!", milestone: "Second trimester begins"),
  PregnancyWeekInsight(week: 14, trimester: 2, babySize: "lemon", babyDevelopment: "Facial expressions developing", motherTips: "You may start showing soon"),
  PregnancyWeekInsight(week: 15, trimester: 2, babySize: "apple", babyDevelopment: "Bones hardening", motherTips: "Continue prenatal exercises"),
  PregnancyWeekInsight(week: 16, trimester: 2, babySize: "avocado", babyDevelopment: "Hearing developing", motherTips: "You might feel baby's movements soon"),
  PregnancyWeekInsight(week: 17, trimester: 2, babySize: "turnip", babyDevelopment: "Fat stores developing", motherTips: "Talk to your baby, they can hear you"),
  PregnancyWeekInsight(week: 18, trimester: 2, babySize: "bell pepper", babyDevelopment: "Hearing is developing", motherTips: "Try talking or singing to your baby"),
  PregnancyWeekInsight(week: 19, trimester: 2, babySize: "mango", babyDevelopment: "Protective coating forming on skin", motherTips: "Sensory development is in full swing"),
  PregnancyWeekInsight(week: 20, trimester: 2, babySize: "banana", babyDevelopment: "Halfway through pregnancy!", motherTips: "Anatomy scan scheduled", milestone: "Halfway point • Anatomy scan"),
  PregnancyWeekInsight(week: 21, trimester: 2, babySize: "carrot", babyDevelopment: "Digestive system practicing", motherTips: "Baby can now swallow amniotic fluid"),
  PregnancyWeekInsight(week: 22, trimester: 2, babySize: "spaghetti squash", babyDevelopment: "Taste buds developing", motherTips: "Your diet affects amniotic fluid taste"),
  PregnancyWeekInsight(week: 23, trimester: 2, babySize: "large mango", babyDevelopment: "Lungs developing rapidly", motherTips: "Practice breathing exercises"),
  PregnancyWeekInsight(week: 24, trimester: 2, babySize: "ear of corn", babyDevelopment: "Face almost fully formed", motherTips: "Baby responds to sounds and touch"),
  PregnancyWeekInsight(week: 25, trimester: 2, babySize: "rutabaga", babyDevelopment: "Hair growing", motherTips: "Increased appetite is normal"),
  PregnancyWeekInsight(week: 26, trimester: 2, babySize: "scallion", babyDevelopment: "Eyes beginning to open", motherTips: "Baby's sleep patterns developing"),
  
  // Third Trimester (27-40)
  PregnancyWeekInsight(week: 27, trimester: 3, babySize: "cauliflower", babyDevelopment: "Third trimester begins", motherTips: "More frequent checkups start now", milestone: "Third trimester begins"),
  PregnancyWeekInsight(week: 28, trimester: 3, babySize: "eggplant", babyDevelopment: "Eyes can blink", motherTips: "Braxton Hicks contractions may start"),
  PregnancyWeekInsight(week: 29, trimester: 3, babySize: "butternut squash", babyDevelopment: "Muscles and lungs maturing", motherTips: "Sleep on your left side for better circulation"),
  PregnancyWeekInsight(week: 30, trimester: 3, babySize: "cabbage", babyDevelopment: "Brain developing rapidly", motherTips: "Stay active with gentle exercises"),
  PregnancyWeekInsight(week: 31, trimester: 3, babySize: "coconut", babyDevelopment: "All five senses working", motherTips: "Baby can now process information"),
  PregnancyWeekInsight(week: 32, trimester: 3, babySize: "jicama", babyDevelopment: "Bones fully formed but soft", motherTips: "Practice relaxation techniques"),
  PregnancyWeekInsight(week: 33, trimester: 3, babySize: "pineapple", babyDevelopment: "Immune system developing", motherTips: "Get enough calcium for baby's bones"),
  PregnancyWeekInsight(week: 34, trimester: 3, babySize: "cantaloupe", babyDevelopment: "Central nervous system maturing", motherTips: "Prepare your hospital bag"),
  PregnancyWeekInsight(week: 35, trimester: 3, babySize: "honeydew melon", babyDevelopment: "Kidneys fully developed", motherTips: "Baby's movements may feel different"),
  PregnancyWeekInsight(week: 36, trimester: 3, babySize: "romaine lettuce", babyDevelopment: "Baby may drop into pelvis", motherTips: "Weekly checkups begin", milestone: "Weekly checkups begin"),
  PregnancyWeekInsight(week: 37, trimester: 3, babySize: "swiss chard", babyDevelopment: "Considered full term", motherTips: "Your baby is ready to meet you soon!", milestone: "Full term pregnancy"),
  PregnancyWeekInsight(week: 38, trimester: 3, babySize: "leek", babyDevelopment: "Gaining about ½ pound per week", motherTips: "Watch for signs of labor"),
  PregnancyWeekInsight(week: 39, trimester: 3, babySize: "mini watermelon", babyDevelopment: "Fully developed and ready", motherTips: "Could be any day now!"),
  PregnancyWeekInsight(week: 40, trimester: 3, babySize: "small pumpkin", babyDevelopment: "Due date!", motherTips: "Congratulations - you've reached your due date!", milestone: "Due date arrived!"),
];

PregnancyWeekInsight getWeekInsight(int week) {
  try {
    return pregnancyWeekInsights.firstWhere((w) => w.week == week);
  } catch (e) {
    return PregnancyWeekInsight(
      week: week,
      trimester: week <= 12 ? 1 : week <= 26 ? 2 : 3,
      babySize: "growing",
      babyDevelopment: "Your baby is developing well",
      motherTips: "Continue with regular checkups",
    );
  }
}

List<PregnancyWeekInsight> getMilestoneWeeks(int currentWeek) {
  final milestones = pregnancyWeekInsights
      .where((w) => w.milestone != null && w.week >= currentWeek)
      .toList();
  return milestones.take(3).toList();
}
