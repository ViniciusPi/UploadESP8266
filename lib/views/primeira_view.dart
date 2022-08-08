import 'package:fluent_ui/fluent_ui.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PrimeiraView extends StatefulWidget {
  const PrimeiraView({Key? key}) : super(key: key);

  @override
  State<PrimeiraView> createState() => _PrimeiraViewState();
}

class _PrimeiraViewState extends State<PrimeiraView> {
  List<_SalesData> data = [
    _SalesData(1, 0),
    _SalesData(2, 0),
    _SalesData(3, 0),
    _SalesData(4, 0),
    _SalesData(5, 40),
    _SalesData(6, 40),
    _SalesData(7, 0),
    _SalesData(8, 0),
    _SalesData(9, 0),
    _SalesData(10, 0),
    _SalesData(11, 40),
    _SalesData(12, 40),
    _SalesData(13, 0),
    _SalesData(14, 0),
    _SalesData(15, 0)
  ];

  Color amareloDLB = Color.fromRGBO(255, 192, 0, 1.0);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 255, 192, 0),
          ),
          Center(
            child: Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 1.2,
              child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                    labelStyle: TextStyle(
                      color: amareloDLB,
                    ),
                  ),
                  primaryYAxis: CategoryAxis(
                    labelStyle: TextStyle(
                      color: amareloDLB,
                    ),
                  ),
                  // Chart title
                  title: ChartTitle(
                    text: 'Tensão',
                    textStyle: TextStyle(color: amareloDLB),
                  ),
                  legend: Legend(
                    isVisible: true,
                    textStyle: TextStyle(color: amareloDLB),
                  ),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_SalesData, int>>[
                    LineSeries<_SalesData, int>(
                        color: amareloDLB,
                        dataSource: data,
                        xValueMapper: (_SalesData sales, _) => sales.year,
                        yValueMapper: (_SalesData sales, _) => sales.sales,
                        name: 'variacao',
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: true))
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final int year;
  final double sales;
}
