// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidStatsModel _$CovidStatsModelFromJson(Map<String, dynamic> json) =>
    CovidStatsModel(
      txnDate: json['txnDate'] as String,
      province: json['province'] as String,
      newCase: (json['newCase'] as num).toInt(),
      totalCase: (json['totalCase'] as num).toInt(),
      newCaseExcludeAbroad: (json['newCaseExcludeAbroad'] as num).toInt(),
      totalCaseExcludeAbroad: (json['totalCaseExcludeAbroad'] as num).toInt(),
      newDeath: (json['newDeath'] as num).toInt(),
      totalDeath: (json['totalDeath'] as num).toInt(),
      updateDate: json['updateDate'] as String,
    );

Map<String, dynamic> _$CovidStatsModelToJson(CovidStatsModel instance) =>
    <String, dynamic>{
      'txnDate': instance.txnDate,
      'province': instance.province,
      'newCase': instance.newCase,
      'totalCase': instance.totalCase,
      'newCaseExcludeAbroad': instance.newCaseExcludeAbroad,
      'totalCaseExcludeAbroad': instance.totalCaseExcludeAbroad,
      'newDeath': instance.newDeath,
      'totalDeath': instance.totalDeath,
      'updateDate': instance.updateDate,
    };
