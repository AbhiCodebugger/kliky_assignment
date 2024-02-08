import 'package:kliky_assignment/data/model/heart_rate_model.dart';

abstract class LocalRepository {
  Future<HealthData> fetchHealthData();
}
