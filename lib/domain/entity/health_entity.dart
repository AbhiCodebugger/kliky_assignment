import 'package:kliky_assignment/data/model/heart_rate_model.dart';

class HealthEntity {
  int? heartRate;
  DailyGoals? dailyGoals;
  int? steps;
  int? lastSleep;

  HealthEntity({
    this.heartRate,
    this.dailyGoals,
    this.steps,
    this.lastSleep,
  });
}
