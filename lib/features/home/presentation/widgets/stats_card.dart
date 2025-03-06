import 'package:flutter/material.dart';

import '../../domain/entities/covid_stats_entity.dart';

class StatsCard extends StatelessWidget {
  final CovidStatsEntity covidStatsEntity;
  const StatsCard({super.key, required this.covidStatsEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(covidStatsEntity.province ?? ""),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('New Cases: ${covidStatsEntity.newCase}'),
            Text('Total Cases: ${covidStatsEntity.totalCase}'),
            Text('New Deaths: ${covidStatsEntity.newDeath}'),
            Text('Total Deaths: ${covidStatsEntity.totalDeath}'),
          ],
        ),
      ),
    );
  }
}
