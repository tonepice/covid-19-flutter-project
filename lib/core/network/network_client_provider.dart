import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'network_client.dart';
import 'package:dio/dio.dart';  // import Dio

// Provider สำหรับ NetworkClient
final networkClientProvider = Provider<NetworkClient>((ref) {
  // สร้าง instance ของ Dio
  final dio = Dio(BaseOptions(baseUrl: 'https://your-api-url.com'));
  
  // สร้างและคืนค่า NetworkClient
  return NetworkClient(dio);  // สร้าง NetworkClient และคืนค่า
});
