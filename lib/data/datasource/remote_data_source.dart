import 'package:kliky_assignment/core/local/local_repository.dart';
import 'package:kliky_assignment/data/model/heart_rate_model.dart';

class RemoteDataSource {
  final LocalRepository _localRepository;
  RemoteDataSource(this._localRepository);

  Future<HealthData> fetchHealthData() async {
    return await _localRepository.fetchHealthData();
  }
}
