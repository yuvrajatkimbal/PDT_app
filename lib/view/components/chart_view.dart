import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartView extends StatefulWidget {
  const ChartView({super.key});

  @override
  State<ChartView> createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  String _selectedInterval = 'Hourly';
  late List<ChartData> _chartData;

  @override
  void initState() {
    super.initState();
    _chartData = _getHourlyData();
  }

  List<ChartData> _getHourlyData() {
    return [
      ChartData('1 AM', 10),
      ChartData('2 AM', 20),
      ChartData('3 AM', 15),
      ChartData('4 AM', 18),
      ChartData('5 AM', 16),
      ChartData('6 AM', 25),
      ChartData('7 AM', 40),
      ChartData('8 AM', 23),
      ChartData('9 AM', 32),
      ChartData('10 AM', 11),
      ChartData('11 AM', 8),
      ChartData('12 AM', 5),
      ChartData('13 AM', 14),
      ChartData('14 AM', 10),
      ChartData('15 AM', 5),
      ChartData('16 AM', 55),
      ChartData('17 AM', 33),
      ChartData('18 AM', 72),
      ChartData('19 AM', 54),
      ChartData('20 AM', 33),
      ChartData('21 AM', 44),
      ChartData('22 AM', 12),
      ChartData('23 AM', 54),
      ChartData('24 AM', 64),
    ];
  }

  List<ChartData> _getDailyData() {
    return [
      ChartData('Mon', 100),
      ChartData('Tue', 150),
      ChartData('Wed', 125),
    ];
  }

  List<ChartData> _getWeeklyData() {
    return [
      ChartData('Week 1', 500),
      ChartData('Week 2', 700),
      ChartData('Week 3', 600),
    ];
  }

  List<ChartData> _getMonthlyData() {
    return [
      ChartData('Jan', 2000),
      ChartData('Feb', 2500),
      ChartData('Mar', 2200),
    ];
  }

  List<ChartData> _getYearlyData() {
    return [
      ChartData('2020', 24000),
      ChartData('2021', 28000),
      ChartData('2022', 26000),
    ];
  }

  void _onIntervalChanged(String? value) {
    setState(() {
      _selectedInterval = value!;
      switch (value) {
        case 'Hourly':
          _chartData = _getHourlyData();
          break;
        case 'Daily':
          _chartData = _getDailyData();
          break;
        case 'Weekly':
          _chartData = _getWeeklyData();
          break;
        case 'Monthly':
          _chartData = _getMonthlyData();
          break;
        case 'Yearly':
          _chartData = _getYearlyData();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
        Stack(children:[
        Padding(
            padding: const EdgeInsets.all(8.0), // Avoid nested padding
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              title: const ChartTitle(text: 'Average Downtime', alignment:ChartAlignment.near),
              series: <CartesianSeries>[
                LineSeries<ChartData, String>(
                  dataSource: _chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                ),
              ],
            ),
          ),
          Positioned(
            top:0,
            right:0,
            child:SizedBox(height:50 ,child:
        DropdownButton<String>(
          value: _selectedInterval,
          items: <String>['Hourly', 'Daily', 'Weekly', 'Monthly', 'Yearly'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: _onIntervalChanged,
        ), ),)
        ],
        );
  }
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}