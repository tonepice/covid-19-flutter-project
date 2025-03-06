// lib/features/covid/data/datasources/covid_remote_data_source.dart
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
      final response = await _client.get('/covid-stats');

      List<CovidStatsModel> covidData = (response.data as List)
          .map((json) => CovidStatsModel.fromJson(json))
          .toList();

      return covidData;
    } catch (e) {
      throw Exception('Failed to fetch Covid stats: $e');
    }
  }
}
