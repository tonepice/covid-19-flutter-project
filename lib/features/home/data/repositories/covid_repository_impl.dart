import 'package:covid_19_flutter/features/home/data/models/covid_stats_model.dart';
import '../../domain/repositories/covid_repository.dart';
import '../datasources/covid_remote_data_source.dart';

class CovidRepositoryImpl implements CovidRepository {
  final CovidRemoteDataSource remoteDataSource;

  CovidRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CovidStatsModel>> getCovidStats() async {
    try {
      final covidStatsModel = await remoteDataSource.fetchCovidStatsModel();
      return covidStatsModel;
    } catch (e) {
      throw Exception('Failed to fetch Covid stats from repository: $e');
    }
  }
}
