import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/network_client_provider.dart';
import '../../data/repositories/covid_repository_impl.dart';
import '../../data/datasources/covid_remote_data_source.dart';
import '../../domain/entities/covid_stats_entity.dart';
import '../../domain/repositories/covid_repository.dart';

// สร้าง Provider สำหรับ CovidRemoteDataSource
final covidRemoteDataSourceProvider = Provider<CovidRemoteDataSource>((ref) {
  // ใช้ networkClientProvider ที่มีอยู่แล้ว
  final networkClient = ref.read(networkClientProvider);
  return CovidRemoteDataSourceImpl(networkClient);
});

// สร้าง Provider สำหรับ CovidRepository
final covidRepositoryProvider = Provider<CovidRepository>((ref) {
  final remoteDataSource = ref.read(covidRemoteDataSourceProvider);
  return CovidRepositoryImpl(remoteDataSource);
});

// สร้าง FutureProvider สำหรับดึงข้อมูล CovidStatsModel
final covidStatsProvider = FutureProvider<List<CovidStatsEntity>>((ref) async {
  final covidRepository = ref.read(covidRepositoryProvider);
  try {
    final covidStats = await covidRepository.getCovidStats();
    return covidStats.map((model) => CovidStatsEntity(
       txnDate: model.txnDate,  // กำหนดค่าเริ่มต้นเป็นค่าว่างถ้าเป็น null
        province: model.province,  // ถ้าเป็น null ให้ใช้ 'Unknown'
        newCase: model.newCase,  // ถ้าเป็น null ให้ใช้ 0
        totalCase: model.totalCase,  // ถ้าเป็น null ให้ใช้ 0
        newDeath: model.newDeath,  // ถ้าเป็น null ให้ใช้ 0
        totalDeath: model.totalDeath,  // ถ้าเป็น null ให้ใช้ 0
        updateDate: model.updateDate,  // ถ้าเป็น null ให้ใช้ค่าว่าง
    )).toList();
  } catch (e) {
    throw Exception('Failed to fetch Covid stats: $e');
  }
});
