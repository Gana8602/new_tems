import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_between_two_points/pages/Statistics/widgets/sampledata.dart';
import 'package:route_between_two_points/pages/Statistics/widgets/wid.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../model/chart_model.dart';

import 'emptydata.dart';

class LineChartView extends StatelessWidget {
  const LineChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChartF();
  }
}

class ChartF extends StatefulWidget {
  const ChartF({super.key});

  @override
  State<StatefulWidget> createState() => ChartFState();
}

class ChartFState extends State<ChartF> {
  ChartWidget _widget = Get.put(ChartWidget());
  EmptyData _empty = Get.put(EmptyData());
  chartDatafill _fill = Get.put(chartDatafill());
  bool dataempty = false;
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      zoomPanBehavior: _widget.zoom,
      primaryXAxis: _widget.x,
      primaryYAxis: _widget.y,
      title: _widget.title,
      series: <CartesianSeries>[
        ScatterSeries<ChartData, int>(
          dataSource: dataempty ? _empty.emptyChart1 : _fill.chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          // sizeValueMapper: (ChartData data, _) => data.size,
        ),
        ScatterSeries<ChartData, int>(
          dataSource: dataempty ? _empty.emptyChart2 : _fill.chartData2,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          // sizeValueMapper: (ChartData data, _) => data.size,
        ),
      ],
      tooltipBehavior: _widget.toolTip,
    );
  }
}
