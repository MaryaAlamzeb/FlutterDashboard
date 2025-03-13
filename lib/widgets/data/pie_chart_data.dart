import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartDataSource {
  static List<PieChartSectionData> getExpenseChartData() {
    return [
      PieChartSectionData(
          value: 37.4,
          color: Color.fromARGB(255, 129, 99, 239),
          title: "37.4%"),
      PieChartSectionData(value: 18.2, color: Colors.orange, title: "18.2%"),
      PieChartSectionData(value: 10.3, color: Colors.yellow, title: "10.3%"),
      PieChartSectionData(value: 8.1, color: Colors.green, title: "8.1%"),
      PieChartSectionData(value: 7.2, color: Colors.red, title: "7.2%"),
      PieChartSectionData(value: 6.0, color: Colors.blue, title: "6.0%"),
      PieChartSectionData(value: 5.8, color: Colors.pink, title: "5.8%"),
    ];
  }

  static List<PieChartSectionData> getIncomeChartData() {
    return [
      PieChartSectionData(
          value: 37.4,
          color: Color.fromARGB(255, 129, 99, 239),
          title: "37.4%"),
      PieChartSectionData(value: 18.2, color: Colors.orange, title: "18.2%"),
      PieChartSectionData(value: 10.3, color: Colors.yellow, title: "10.3%"),
      PieChartSectionData(value: 8.1, color: Colors.green, title: "8.1%"),
      PieChartSectionData(value: 7.2, color: Colors.red, title: "7.2%"),
      PieChartSectionData(value: 6.0, color: Colors.blue, title: "6.0%"),
      PieChartSectionData(value: 5.8, color: Colors.pink, title: "5.8%"),
    ];
  }

  static List<PieChartSectionData> getBankBalanceChartData() {
    return [
      PieChartSectionData(
          value: 79.4, color: Color.fromARGB(255, 129, 99, 239), title: ""),
      PieChartSectionData(value: 15.1, color: Colors.orange, title: ""),
      PieChartSectionData(value: 5.5, color: Colors.green, title: ""),
    ];
  }

  static List<String> labels = [
    "MORADIA",
    "ALIMENTAÇÃO",
    "LAZER",
    "CONSUMO",
    "ESTUDOS",
    "TRANSPORTE",
    "PETS"
  ];

  static List<Color> colors = [
    Color.fromARGB(255, 129, 99, 239),
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.pink
  ];
}
