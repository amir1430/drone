import 'package:collection/collection.dart';
import 'package:drone/core/core.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:repo_repository/repo_repository.dart';

typedef DroneBarChartCallBack = void Function(int index);

class DroneBarChart extends HookWidget {
  const DroneBarChart({
    super.key,
    required this.builds,
    this.callBack,
  });

  final List<DroneBuild> builds;
  final DroneBarChartCallBack? callBack;

  @override
  Widget build(BuildContext context) {
    final yTickValues = useMemoized(() => getYTickValues(builds), [builds]);

    final data = useMemoized(
      () {
        final max = yTickValues[yTickValues.length - 1];
        final withHeight = builds.map((e) {
          final value = e.duration / (max * .01) / 100;
          final status = e.status;

          return BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: value == 0
                    ? (max * .001)
                    : double.parse(value.toStringAsFixed(2)),
                color: status.color,
              ),
            ],
          );
        });
        return [...withHeight];
      },
      [builds, yTickValues],
    );

    return BarChart(
      BarChartData(
        barGroups: data,
        barTouchData: BarTouchData(
          touchCallback: (event, response) {
            if (event is FlPanDownEvent) {
              if (response?.spot != null) {
                final index = response!.spot?.touchedBarGroupIndex;
                if (index != null) {
                  callBack?.call(index);
                }
              }
            }
          },
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: context.primaryColor,
            tooltipRoundedRadius: 12,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '#.${builds[groupIndex].number}',
                context.textTheme.caption!.copyWith(
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
        maxY: yTickValues[yTickValues.length - 1].toDouble() / 60,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(),
          rightTitles: AxisTitles(),
          topTitles: AxisTitles(),
          leftTitles: AxisTitles(),
          // leftTitles: AxisTitles(
          //   sideTitles: SideTitles(
          //     showTitles: true,
          //     interval: yTickValues[yTickValues.length - 1].toDouble(),
          //   ),
        ),
      ),
    );
  }
}

int roundUpMinutes(int secs, {bool shouldBeDivisibleBy5 = false}) {
  var temp = secs;
  if (shouldBeDivisibleBy5) {
    while (!(temp % 60 == 0) && !((temp / 60) % 5 == 0)) {
      temp += 1;
    }
  } else {
    while (temp % 60 != 0) {
      temp += 1;
    }
  }
  return temp;
}

List<num> getYTickValues(List<DroneBuild> data) {
  final max =
      data.sorted((a, b) => b.duration.compareTo(a.duration))[0].duration;
  var topBp = roundUpMinutes(max);
  if (max < 60) {
    return [0, topBp];
  }
  if (max < 360) {
    return [0, (topBp / 2).floor(), topBp];
  }
  topBp = roundUpMinutes(max, shouldBeDivisibleBy5: true);
  return [0, topBp * 0.25, topBp * 0.5, topBp * 0.75, topBp];
}

extension DroneBuildX on DroneBuild {
  int get duration {
    return (finished == 0
            ? DateTime.now().millisecondsSinceEpoch ~/ 1000
            : finished) -
        (started == 0 ? created : started);
  }
}
    
// extension BuildsX on List<DroneBuild> {
//   List<DroneBuild> get lastBuilds =>
//       [...sublist(0, length > 25 ? 24 : length - 1).reversed];

//   int get maxDuration =>
//       lastBuilds.sorted((a, b) => b.duration.compareTo(a.duration))[0].duration;

//   List<BarChartGroupData> get barChartList {
//     return [
//       ...lastBuilds.map(
//         (e) {
//           final max = getYTickValues(lastBuilds);
//           return BarChartGroupData(
//             x: indexOf(e) + 1,
//             barRods: [
//               BarChartRodData(
//                 toY: double.parse(
//                   (e.duration == 0
//                           ? max[max.length - 1] * .16 / 100
//                           : e.duration / (max[max.length - 1] * .01) / 100)
//                       .toStringAsFixed(2),
//                 ),
//                 color: e.status.toStepStatus() == StepStatus.success
//                     ? Colors.green
//                     : Colors.red,
//               )
//             ],
//           );
//         },
//       )
//     ];
//   }
// }
