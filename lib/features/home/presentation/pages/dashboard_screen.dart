import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/covid_provider.dart';
import '../widgets/stats_card.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  static const String route = 'dash-board-screen';
  const DashBoardScreen({super.key});

  @override
  ConsumerState<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    final covidStatsAsync = ref.watch(covidStatsProvider);
    final isLoading = ref.watch(isLoadingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('COVID Dashboard'),
      ),
      body: Column(
        children: [
          // ปุ่มควบคุม
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 20,
                runSpacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      ref.read(isLoadingProvider.notifier).state = true;
                      await ref.refresh(covidStatsProvider.future);
                      ref.read(isLoadingProvider.notifier).state = false;
                    },
                    child: const Text('ดึงข้อมูลใหม่'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // เรียงข้อมูลจังหวัด ก-ฮ
                      ref.read(covidStatsProvider.future).then((data) {
                        data.sort(
                            (a, b) => a.province!.compareTo(b.province ?? ""));
                      });
                      setState(() {});
                    },
                    child: const Text('เรียงจังหวัด'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // เรียงตามจำนวนเคส
                      ref.read(covidStatsProvider.future).then((data) {
                        data.sort(
                            (a, b) => b.totalCase!.compareTo(a.totalCase ?? 0));
                      });
                      setState(() {});
                    },
                    child: const Text('เรียงตามจำนวนเคส'),
                  ),
                ],
              ),
            ),
          ),
          // แสดง Indicator กลางจอถ้าโหลดอยู่
          if (isLoading)
            const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else
            // แสดงข้อมูล
            Expanded(
              child: covidStatsAsync.when(
                data: (covidStats) {
                  return ListView.builder(
                    itemCount: covidStats.length,
                    itemBuilder: (context, index) {
                      final stat = covidStats[index];
                      return StatsCard(covidStatsEntity: stat);
                    },
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error: $error',
                        style: const TextStyle(color: Colors.red, fontSize: 18),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          ref.refresh(covidStatsProvider);
                        },
                        child: const Text('ลองใหม่'),
                      ),
                    ],
                  ),
                ),
                loading: () =>
                    const SizedBox(), // ไม่ต้องแสดงอะไร เพราะใช้ isLoadingProvider แทน
              ),
            ),
        ],
      ),
    );
  }
}
