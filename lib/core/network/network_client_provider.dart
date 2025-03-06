import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'network_client.dart';
import 'package:dio/dio.dart';

final networkClientProvider = Provider<NetworkClient>((ref) {
  final dio = Dio(BaseOptions(baseUrl: 'https://covid19.ddc.moph.go.th/api'));
  
  return NetworkClient(dio);  
});
