import '../../data/models/covid_stats_model.dart';

abstract class CovidRepository {
  Future<List<CovidStatsModel>> getCovidStats();
}