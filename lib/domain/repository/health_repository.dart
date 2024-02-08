import 'package:kliky_assignment/domain/entity/health_entity.dart';

abstract class HealthRepository {
  Future<HealthEntity> getHealthData();
}
