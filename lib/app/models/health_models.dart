class HealthReading {
  final String id;
  final String type; // blood_pressure, heart_rate, temperature, blood_glucose
  final double value;
  final String unit;
  final DateTime timestamp;
  final String? notes;

  HealthReading({
    required this.id,
    required this.type,
    required this.value,
    required this.unit,
    required this.timestamp,
    this.notes,
  });
}

class DailyHealth {
  final String id;
  final DateTime date;
  final List<HealthReading> readings;
  final int stepsCount;
  final double waterIntake; // in liters
  final int sleepDuration; // in minutes
  final String? moodNote;

  DailyHealth({
    required this.id,
    required this.date,
    required this.readings,
    required this.stepsCount,
    required this.waterIntake,
    required this.sleepDuration,
    this.moodNote,
  });
}

class Appointment {
  final String id;
  final String title;
  final DateTime dateTime;
  final String doctorName;
  final String specialty;
  final String location;
  final String? notes;
  final bool isCompleted;

  Appointment({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.doctorName,
    required this.specialty,
    required this.location,
    this.notes,
    required this.isCompleted,
  });
}

class Report {
  final String id;
  final String title;
  final DateTime generatedDate;
  final String type; // blood_pressure, glucose, ultrasound, etc
  final String content;
  final String doctorName;

  Report({
    required this.id,
    required this.title,
    required this.generatedDate,
    required this.type,
    required this.content,
    required this.doctorName,
  });
}

class Medication {
  final String id;
  final String name;
  final String dosage;
  final String frequency; // daily, twice_daily, three_times, etc
  final DateTime startDate;
  final DateTime? endDate;
  final bool isTaken;

  Medication({
    required this.id,
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.startDate,
    this.endDate,
    required this.isTaken,
  });
}

class PregnancyInfo {
  final String id;
  final DateTime lastMenstrualPeriod;
  final DateTime estimatedDueDate;
  final int weekOfPregnancy;
  final String? babyGender;
  final List<String> previousMiscarriages;

  PregnancyInfo({
    required this.id,
    required this.lastMenstrualPeriod,
    required this.estimatedDueDate,
    required this.weekOfPregnancy,
    this.babyGender,
    required this.previousMiscarriages,
  });
}

class Alert {
  final String id;
  final String title;
  final String message;
  final String severity; // info, warning, critical
  final DateTime createdAt;
  final bool isRead;

  Alert({
    required this.id,
    required this.title,
    required this.message,
    required this.severity,
    required this.createdAt,
    required this.isRead,
  });
}
