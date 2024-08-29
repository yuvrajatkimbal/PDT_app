import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DowntimeReasonChart extends StatelessWidget {
  final List<DowntimeData> downtimeData = [
    DowntimeData('Break', 30),
    DowntimeData('System Down', 40),
    DowntimeData('Machine Failure', 20),
    DowntimeData('Less Manpower', 10),
    DowntimeData('Other', 15),
  ];

  DowntimeReasonChart({super.key});

  @override
  Widget build(BuildContext context) {
        double screenWidth;
    if (MediaQuery.of(context).size.width <= 800) {
      screenWidth = MediaQuery.of(context).size.width;
    } else {
      screenWidth = MediaQuery.of(context).size.width/2.27;
    }
    return Container(
      width: screenWidth,
      height: 375,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(149, 0, 0, 0),),
        borderRadius: const BorderRadius.all(Radius.circular(8))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30,),
          SfCircularChart(
            // title:const ChartTitle(text: 'Downtime Reason Stats', alignment:ChartAlignment.far),
            legend: const Legend(
                isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            series: <CircularSeries>[
              PieSeries<DowntimeData, String>(
                dataSource: downtimeData,
                xValueMapper: (DowntimeData data, _) => data.reason,
                yValueMapper: (DowntimeData data, _) => data.duration,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DowntimeData {
  final String reason;
  final double duration;

  DowntimeData(this.reason, this.duration);
}
