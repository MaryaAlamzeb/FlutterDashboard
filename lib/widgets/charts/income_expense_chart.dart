import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class IncomeExpenseChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade200, blurRadius: 10),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Income and Expense History",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    // Total Income
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 12),
                        FlSpot(1, 15),
                        FlSpot(2, 20),
                        FlSpot(3, 18),
                        FlSpot(4, 25),
                        FlSpot(5, 30),
                        FlSpot(6, 35),
                        FlSpot(7, 40),
                        FlSpot(8, 38),
                        FlSpot(9, 42),
                        FlSpot(10, 48),
                        FlSpot(11, 50),
                      ],
                      isCurved: true,
                      color: Colors.purple,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                      dotData: FlDotData(show: false),
                    ),

                    // Total Expense
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 20),
                        FlSpot(1, 22),
                        FlSpot(2, 19),
                        FlSpot(3, 25),
                        FlSpot(4, 30),
                        FlSpot(5, 28),
                        FlSpot(6, 32),
                        FlSpot(7, 27),
                        FlSpot(8, 22),
                        FlSpot(9, 24),
                        FlSpot(10, 20),
                        FlSpot(11, 18),
                      ],
                      isCurved: true,
                      color: Colors.orange,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                      dotData: const FlDotData(show: false),
                    ),
                  ],
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 10,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.shade300,
                        strokeWidth: 1,
                        dashArray: [5, 5],
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 10:
                              return const Text("10K",
                                  style: TextStyle(fontSize: 12));
                            case 20:
                              return const Text("20K",
                                  style: TextStyle(fontSize: 12));
                            case 30:
                              return const Text("30K",
                                  style: TextStyle(fontSize: 12));
                            case 40:
                              return const Text("40K",
                                  style: TextStyle(fontSize: 12));
                            case 50:
                              return const Text("50K",
                                  style: TextStyle(fontSize: 12));
                            default:
                              return Container();
                          }
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          const months = [
                            "JAN",
                            "FEB",
                            "MAR",
                            "APR",
                            "MAY",
                            "JUN",
                            "JUL",
                            "AUG",
                            "SEP",
                            "OCT",
                            "NOV",
                            "DEC"
                          ];
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              months[value.toInt()],
                              style: const TextStyle(fontSize: 12),
                            ),
                          );
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  minX: 0,
                  maxX: 11,
                  minY: 10,
                  maxY: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
