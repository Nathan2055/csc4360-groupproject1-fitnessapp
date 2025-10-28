import 'package:flutter/material.dart';
import 'package:fitnessapp/widgets/title_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fitnessapp/models/database_helper.dart';

// Utility functions from fl_chart's example files
// https://github.com/imaNNeo/fl_chart/blob/main/example/lib/util/extensions/color_extensions.dart
extension ColorExtension on Color {
  /// Convert the color to a darken color based on the [percent]
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(
      _floatToInt8(a),
      (_floatToInt8(r) * value).round(),
      (_floatToInt8(g) * value).round(),
      (_floatToInt8(b) * value).round(),
    );
  }

  Color lighten([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = percent / 100;
    return Color.fromARGB(
      _floatToInt8(a),
      (_floatToInt8(r) + ((255 - _floatToInt8(r)) * value)).round(),
      (_floatToInt8(g) + ((255 - _floatToInt8(g)) * value)).round(),
      (_floatToInt8(b) + ((255 - _floatToInt8(b)) * value)).round(),
    );
  }

  Color avg(Color other) {
    final red = (_floatToInt8(r) + _floatToInt8(other.r)) ~/ 2;
    final green = (_floatToInt8(g) + _floatToInt8(other.g)) ~/ 2;
    final blue = (_floatToInt8(b) + _floatToInt8(other.b)) ~/ 2;
    final alpha = (_floatToInt8(a) + _floatToInt8(other.a)) ~/ 2;
    return Color.fromARGB(alpha, red, green, blue);
  }

  // Int color components were deprecated in Flutter 3.27.0.
  // This method is used to convert the new double color components to the
  // old int color components.
  //
  // Taken from the Color class.
  int _floatToInt8(double x) {
    return (x * 255.0).round() & 0xff;
  }
}

class ProgressReportsScreen extends StatefulWidget {
  const ProgressReportsScreen({super.key});

  @override
  State<ProgressReportsScreen> createState() => _ProgressReportsScreenState();
}

class _ProgressReportsScreenState extends State<ProgressReportsScreen> {
  late List<WorkoutEntry> allWorkouts = [];
  bool isLoading = true;
  String? errorMessage;

  late Future<BarChart> _barChart;

  @override
  void initState() {
    super.initState();
    _barChart = getBarChart();
  }

  void _retry() {
    setState(() {
      _barChart = getBarChart();
    });
  }

  Future<void> _loadWorkouts() async {
    try {
      final loadedWorkouts = await DBHelper.instance.getWorkouts();
      setState(() {
        allWorkouts = loadedWorkouts;
        isLoading = false;
        errorMessage = null;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = e.toString();
      });
    }
  }

  Future<List<BarChartGroupData>> _getWorkoutData() async {
    var rawData_today = await DBHelper.instance.getWorkouts_today();
    var rawData_day1 = await DBHelper.instance.getWorkouts_day1();
    var rawData_day2 = await DBHelper.instance.getWorkouts_day2();
    var rawData_day3 = await DBHelper.instance.getWorkouts_day3();
    var rawData_day4 = await DBHelper.instance.getWorkouts_day4();

    var totalDuration_today = 0;
    for (int i = 0; i < rawData_today.length; i++) {
      totalDuration_today = totalDuration_today + rawData_today[i].duration;
    }
    //debugPrint(totalDuration_today.toString());

    var totalDuration_day1 = 0;
    for (int i = 0; i < rawData_day1.length; i++) {
      totalDuration_day1 = totalDuration_day1 + rawData_day1[i].duration;
    }

    var totalDuration_day2 = 0;
    for (int i = 0; i < rawData_day2.length; i++) {
      totalDuration_day2 = totalDuration_day2 + rawData_day2[i].duration;
    }

    var totalDuration_day3 = 0;
    for (int i = 0; i < rawData_day3.length; i++) {
      totalDuration_day3 = totalDuration_day3 + rawData_day3[i].duration;
    }

    var totalDuration_day4 = 0;
    for (int i = 0; i < rawData_day4.length; i++) {
      totalDuration_day4 = totalDuration_day4 + rawData_day4[i].duration;
    }

    /*
    var rawData = await DBHelper.instance.getLastFiveDaysOfWorkouts();
    DateTime today = DateTime.now();
    DateTime day_1 = today.subtract(const Duration(days: 1));
    DateTime day_2 = today.subtract(const Duration(days: 2));
    DateTime day_3 = today.subtract(const Duration(days: 3));
    DateTime day_4 = today.subtract(const Duration(days: 4));
    */

    List<BarChartGroupData> barGroups = [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            toY: totalDuration_day4.toDouble(),
            //gradient: _barsGradient,
          ),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            toY: totalDuration_day3.toDouble(),
            //gradient: _barsGradient,
          ),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
            toY: totalDuration_day2.toDouble(),
            //gradient: _barsGradient,
          ),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
            toY: totalDuration_day1.toDouble(),
            //gradient: _barsGradient,
          ),
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(
            toY: totalDuration_today.toDouble(),
            //gradient: _barsGradient,
          ),
        ],
        showingTooltipIndicators: [0],
      ),
    ];

    return barGroups;
  }

  Future<BarChart> getBarChart() async {
    List<BarChartGroupData> barData = await _getWorkoutData();

    BarChart chart = BarChart(
      BarChartData(
        //barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barData,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );

    return chart;
  }

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text = switch (value.toInt()) {
      0 => '4 Days Ago',
      1 => '3 Days Ago',
      2 => '2 Days Ago',
      3 => 'Yesterday',
      4 => 'Today',
      5 => 'St',
      6 => 'Sn',
      _ => '',
    };
    return SideTitleWidget(
      meta: meta,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTitlesWidget: getTitles,
      ),
    ),
    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
  );

  FlBorderData get borderData => FlBorderData(show: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(title: const Text('Progress Reports')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<BarChart>(
              future: _barChart,
              builder:
                  (BuildContext context, AsyncSnapshot<BarChart> snapshot) {
                    if (!snapshot.hasData) {
                      // while data is loading:
                      return Center(child: CircularProgressIndicator());
                    } else {
                      // data loaded:
                      final widget = snapshot.data;
                      return Flexible(child: widget!);
                    }
                  },
            ),
            /*
            Icon(Icons.show_chart, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'View your progress',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Coming soon...',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            */
          ],
        ),
      ),
    );
  }
}
