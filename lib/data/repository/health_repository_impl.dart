import 'package:kliky_assignment/core/local/local_repository.dart';
import 'package:kliky_assignment/data/mapper/health_mapper.dart';
import 'package:kliky_assignment/domain/entity/health_entity.dart';
import 'package:kliky_assignment/domain/repository/health_repository.dart';
import 'package:kliky_assignment/data/model/heart_rate_model.dart';

class HealthRepositoryImpl implements HealthRepository {
  final LocalRepository localRepository;
  HealthRepositoryImpl(this.localRepository);
  @override
  Future<HealthEntity> getHealthData() async {
    try {
      HealthData healthData = await localRepository.fetchHealthData();
      return HealthMapper().convert(healthData);
    } catch (e) {
      rethrow;
    }
  }
}
