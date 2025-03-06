// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidStatsModel _$CovidStatsModelFromJson(Map<String, dynamic> json) =>
    CovidStatsModel(
      txnDate: json['txn_date'] as String?,
      province: json['province'] as String?,
      newCase: (json['new_case'] as num?)?.toInt(),
      totalCase: (json['total_case'] as num?)?.toInt(),
      newCaseExcludeAbroad: (json['new_case_excludeabroad'] as num?)?.toInt(),
      totalCaseExcludeAbroad:
          (json['total_case_excludeabroad'] as num?)?.toInt(),
      newDeath: (json['new_death'] as num?)?.toInt(),
      totalDeath: (json['total_death'] as num?)?.toInt(),
      updateDate: json['update_date'] as String?,
      year: (json['year'] as num?)?.toInt(),
      weeknum: (json['weeknum'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CovidStatsModelToJson(CovidStatsModel instance) =>
    <String, dynamic>{
      'txn_date': instance.txnDate,
      'province': instance.province,
      'new_case': instance.newCase,
      'total_case': instance.totalCase,
      'new_case_excludeabroad': instance.newCaseExcludeAbroad,
      'total_case_excludeabroad': instance.totalCaseExcludeAbroad,
      'new_death': instance.newDeath,
      'total_death': instance.totalDeath,
      'update_date': instance.updateDate,
      'year': instance.year,
      'weeknum': instance.weeknum,
    };
