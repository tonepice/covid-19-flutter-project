import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/covid_provider.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  static const String route = 'dash-board-screen';
  const DashBoardScreen({super.key});

  @override
  ConsumerState<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    // ดึงข้อมูลจาก provider
    final covidStatsAsync = ref.watch(covidStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('COVID Dashboard'),
      ),
      body: covidStatsAsync.when(
        data: (covidStats) {
          return ListView.builder(
            itemCount: covidStats.length,
            itemBuilder: (context, index) {
              final stat = covidStats[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(stat.province),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('New Cases: ${stat.newCase}'),
                      Text('Total Cases: ${stat.totalCase}'),
                      Text('New Deaths: ${stat.newDeath}'),
                      Text('Total Deaths: ${stat.totalDeath}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
        // กรณีกำลังโหลดข้อมูล
        loading: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading data... Please wait', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        // กรณีเกิดข้อผิดพลาด
        error: (error, stackTrace) => Center(
          child: Text(
            'Error: $error',
            style: const TextStyle(color: Colors.red, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
