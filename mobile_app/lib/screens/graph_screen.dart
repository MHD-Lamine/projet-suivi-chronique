import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Suivi graphique")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text("Glycémie (g/L)", style: TextStyle(fontSize: 18)),
            SizedBox(height: 200, child: _buildChart([1.1, 1.2, 1.3, 1.0, 1.2])),
            const SizedBox(height: 20),
            const Text("Tension (systolique en mmHg)", style: TextStyle(fontSize: 18)),
            SizedBox(height: 200, child: _buildChart([120, 125, 130, 118, 122])),
            const SizedBox(height: 20),
            const Text("Fréquence cardiaque (bpm)", style: TextStyle(fontSize: 18)),
            SizedBox(height: 200, child: _buildChart([72, 75, 78, 76, 74])),
          ],
        ),
      ),
    );
  }

  LineChart _buildChart(List<double> data) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: data
                .asMap()
                .entries
                .map((e) => FlSpot(e.key.toDouble(), e.value))
                .toList(),
            isCurved: true,
            color: Colors.indigo,
            belowBarData: BarAreaData(show: false),
            dotData: FlDotData(show: true),
          )
        ],
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
