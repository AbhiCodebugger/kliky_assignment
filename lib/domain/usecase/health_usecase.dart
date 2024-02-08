import 'package:kliky_assignment/domain/entity/health_entity.dart';
import 'package:kliky_assignment/domain/repository/health_repository.dart';

class HealthUseCase {
  final HealthRepository repository;
  HealthUseCase(this.repository);

  Future<HealthEntity> loadHealthData() async {
    return await repository.getHealthData();
  }
}
