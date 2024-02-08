import 'package:kliky_assignment/domain/entity/health_entity.dart';
import 'package:kliky_assignment/data/model/heart_rate_model.dart';

class HealthMapper {
  HealthEntity convert(HealthData healthData) {
    return HealthEntity(
      heartRate: healthData.heartRate,
      dailyGoals: healthData.dailyGoals,
      lastSleep: healthData.lastSleep,
      steps: healthData.steps,
    );
  }
}
