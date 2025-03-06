import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'covid_stats_model.g.dart';

@JsonSerializable()
class CovidStatsModel extends Equatable {
  @JsonKey(name: 'txn_date') // กำหนดชื่อให้ตรงกับ JSON
  final String? txnDate;

  @JsonKey(name: 'province')
  final String? province;

  @JsonKey(name: 'new_case')
  final int? newCase;

  @JsonKey(name: 'total_case')
  final int? totalCase;

  @JsonKey(name: 'new_case_excludeabroad')
  final int? newCaseExcludeAbroad;

  @JsonKey(name: 'total_case_excludeabroad')
  final int? totalCaseExcludeAbroad;

  @JsonKey(name: 'new_death')
  final int? newDeath;

  @JsonKey(name: 'total_death')
  final int? totalDeath;

  @JsonKey(name: 'update_date')
  final String? updateDate;

  @JsonKey(name: 'year')
  final int? year;

  @JsonKey(name: 'weeknum')
  final int? weeknum;

  const CovidStatsModel({
    this.txnDate,
    this.province,
    this.newCase,
    this.totalCase,
    this.newCaseExcludeAbroad,
    this.totalCaseExcludeAbroad,
    this.newDeath,
    this.totalDeath,
    this.updateDate,
    this.year,
    this.weeknum,
  });

  const CovidStatsModel.pure()
      : txnDate = '',
        province = '',
        newCase = 0,
        totalCase = 0,
        newCaseExcludeAbroad = 0,
        totalCaseExcludeAbroad = 0,
        newDeath = 0,
        totalDeath = 0,
        updateDate = '',
        year = 0,
        weeknum = 0;

  /// **แปลง JSON -> Object**
  factory CovidStatsModel.fromJson(Map<String, dynamic> json) =>
      _$CovidStatsModelFromJson(json);

  /// **แปลง Object -> JSON**
  Map<String, dynamic> toJson() => _$CovidStatsModelToJson(this);

  @override
  List<Object?> get props => [
        txnDate,
        province,
        newCase,
        totalCase,
        newCaseExcludeAbroad,
        totalCaseExcludeAbroad,
        newDeath,
        totalDeath,
        updateDate,
        year,
        weeknum,
      ];
}
