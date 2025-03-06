import 'package:easy_localization/easy_localization.dart';
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
                      // ignore: unused_result
                      await ref.refresh(covidStatsProvider.future);
                      ref.read(isLoadingProvider.notifier).state = false;
                    },
                    child: Text('common.reload'.tr()),
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
                    child: Text('common.arrange_provinces'.tr()),
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
                    child: Text('common.sort_case'.tr()),
                  ),
                ],
              ),
            ),
          ),
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
                          // ignore: unused_result
                          ref.refresh(covidStatsProvider);
                        },
                        child: Text('common.try_agian'.tr()),
                      ),
                    ],
                  ),
                ),
                loading: () => const SizedBox(),
              ),
            ),
        ],
      ),
    );
  }
}
