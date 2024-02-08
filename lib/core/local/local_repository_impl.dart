import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:kliky_assignment/core/local/local_repository.dart';
import 'package:kliky_assignment/data/model/heart_rate_model.dart';

class LocalRepositoryImpl implements LocalRepository {
  @override
  Future<HealthData> fetchHealthData() async {
    print('localrepository');
    String jsonString =
        await rootBundle.loadString('assets/json/health_data.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return HealthData.fromJson(jsonMap);
  }
}
