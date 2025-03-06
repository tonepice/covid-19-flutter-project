// features/covid_stats/domain/entities/covid_stats_entity.dart
class CovidStatsEntity {
  final String txnDate;
  final String province;
  final int newCase;
  final int totalCase;
  final int newDeath;
  final int totalDeath;
  final String updateDate;

  const CovidStatsEntity({
    required this.txnDate,
    required this.province,
    required this.newCase,
    required this.totalCase,
    required this.newDeath,
    required this.totalDeath,
    required this.updateDate,
  });
}
