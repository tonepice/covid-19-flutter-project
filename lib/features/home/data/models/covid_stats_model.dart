import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'covid_stats_model.g.dart';

@JsonSerializable()
class CovidStatsModel extends Equatable {
  final String txnDate;
  final String province;
  final int newCase;
  final int totalCase;
  final int newCaseExcludeAbroad;
  final int totalCaseExcludeAbroad;
  final int newDeath;
  final int totalDeath;
  final String updateDate;

  const CovidStatsModel({
    required this.txnDate,
    required this.province,
    required this.newCase,
    required this.totalCase,
    required this.newCaseExcludeAbroad,
    required this.totalCaseExcludeAbroad,
    required this.newDeath,
    required this.totalDeath,
    required this.updateDate,
  });

  /// **Constructor ค่าเริ่มต้น**
  const CovidStatsModel.pure()
      : txnDate = '',
        province = '',
        newCase = 0,
        totalCase = 0,
        newCaseExcludeAbroad = 0,
        totalCaseExcludeAbroad = 0,
        newDeath = 0,
        totalDeath = 0,
        updateDate = '';

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
      ];
}
