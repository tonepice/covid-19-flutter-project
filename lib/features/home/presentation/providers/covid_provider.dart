import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/network_client_provider.dart';
import '../../data/repositories/covid_repository_impl.dart';
import '../../data/datasources/covid_remote_data_source.dart';
import '../../domain/entities/covid_stats_entity.dart';
import '../../domain/repositories/covid_repository.dart';

final isLoadingProvider = StateProvider<bool>((ref) => false);

final covidRemoteDataSourceProvider = Provider<CovidRemoteDataSource>((ref) {
  final networkClient = ref.read(networkClientProvider);
  return CovidRemoteDataSourceImpl(networkClient);
});

final covidRepositoryProvider = Provider<CovidRepository>((ref) {
  final remoteDataSource = ref.read(covidRemoteDataSourceProvider);
  return CovidRepositoryImpl(remoteDataSource);
});

final covidStatsProvider = FutureProvider<List<CovidStatsEntity>>((ref) async {
  final covidRepository = ref.read(covidRepositoryProvider);
  try {
    final covidStats = await covidRepository.getCovidStats();
    return covidStats.map((model) => CovidStatsEntity(
       txnDate: model.txnDate,  
        province: model.province,  
        newCase: model.newCase, 
        totalCase: model.totalCase,
        newDeath: model.newDeath, 
        totalDeath: model.totalDeath, 
        updateDate: model.updateDate,
    )).toList();
  } catch (e) {
    throw Exception('Failed to fetch Covid stats: $e');
  }
});
