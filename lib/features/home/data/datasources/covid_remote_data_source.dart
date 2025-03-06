import 'package:flutter/foundation.dart';

import '../../../../core/network/network_client.dart';
import '../models/covid_stats_model.dart';

abstract class CovidRemoteDataSource {
  Future<List<CovidStatsModel>> fetchCovidStatsModel();
}

class CovidRemoteDataSourceImpl implements CovidRemoteDataSource {
  final NetworkClient _client;

  CovidRemoteDataSourceImpl(this._client);

  @override
  Future<List<CovidStatsModel>> fetchCovidStatsModel() async {
    try {
      final response = await _client.get('/Cases/today-cases-by-provinces');

      if (response.data != null) {
        if (kDebugMode) {
          print(response.data);
        }
        List<CovidStatsModel> covidData = (response.data as List)
            .where((json) => json != null)
            .map((json) =>
                CovidStatsModel.fromJson(json as Map<String, dynamic>))
            .toList();

        return covidData;
      } else {
        throw Exception('Response data is null');
      }
    } catch (e) {
      throw Exception('Failed to fetch Covid stats: $e');
    }
  }
}
