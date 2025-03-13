import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartCard extends StatelessWidget {
  final String title;
  final List<PieChartSectionData> chartData;
  final List<String> labels;
  final List<Color> colors;

  const ChartCard({
    Key? key,
    required this.title,
    required this.chartData,
    required this.labels,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isBankBalance = title == "Bank Balance";

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          SizedBox(
            height: isBankBalance ? 310 : 300,
            width: isBankBalance ? 200 : 300,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    centerSpaceRadius: isBankBalance ? 100 : 0,
                    sectionsSpace: 0,
                    borderData: FlBorderData(show: false),
                    startDegreeOffset: 180,
                    sections: chartData.map((section) {
                      return PieChartSectionData(
                        value: section.value,
                        color: section.color,
                        title: "${section.value}%",
                        titleStyle: TextStyle(
                          fontSize: isBankBalance ? 14 : 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        radius: isBankBalance ? 40 : 100,
                      );
                    }).toList(),
                  ),
                ),
                if (isBankBalance)
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Banks",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "50,000,000",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Legend for Expenses & Income
          if (!isBankBalance)
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 8,
              children: List.generate(labels.length, (index) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: colors[index],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      labels[index],
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              }),
            ),

          // Legend for Bank Balance
          if (isBankBalance)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 8,
                children: [
                  _buildLegendItem(
                      "ABC Bank", const Color.fromARGB(255, 129, 99, 239)),
                  _buildLegendItem("CBA Bank", Colors.orange),
                  _buildLegendItem("BCA Bank", Colors.green),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // Helper function for legends
  Widget _buildLegendItem(String text, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
