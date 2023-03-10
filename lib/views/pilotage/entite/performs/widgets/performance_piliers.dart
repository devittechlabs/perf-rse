import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PerformancePiliers extends StatefulWidget {
  const PerformancePiliers({Key? key}) : super(key: key);

  @override
  State<PerformancePiliers> createState() => _PerformancePiliersState();
}

class _PerformancePiliersState extends State<PerformancePiliers> {

  late double _columnWidth;
  late double _columnSpacing;
  TooltipBehavior? _tooltipBehavior;
  bool isCardView = true;

  @override
  void initState() {
    _columnWidth = 0.8;
    _columnSpacing = 0.2;
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }



  Widget noDataWidget(String message){
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 40,
              icon: const Icon(Icons.refresh,color: Colors.green,),
              onPressed: () {},
              tooltip: "Réchager les données",
            ).scale(all: 1),
            const SizedBox(width: 50,),
            Center(child: Text("${message}",style: const TextStyle(fontSize: 20),))
          ]
      ),
    );
  }

  Widget loadingWidget(){
    return Center(child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SpinKitPouringHourGlassRefined(color: Colors.amber, size: 50.0,),
        SizedBox(width: 50,),
        Text("Veillez patienter SVP",style: TextStyle(fontSize: 20),)
      ],
    ),);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = true;
    final data = "data";
        return Stack(
          alignment: AlignmentDirectional.center,
          children: const [
            SizedBox(height:100,width: 100,child: CircularProgressIndicator(color: Colors.grey,strokeWidth: 8,)),
            SizedBox(height:50,width: 50,child: CircularProgressIndicator(color: Colors.amber,strokeWidth: 8)),
          ],
        );
  }


  ///Get the cartesian chart widget

  ///Get the column series

  @override
  void dispose() {
    super.dispose();
  }
}

class PerformanceEnjeux extends StatefulWidget {
  const PerformanceEnjeux({Key? key}) : super(key: key);

  @override
  State<PerformanceEnjeux> createState() => _PerformanceEnjeuxState();
}

class _PerformanceEnjeuxState extends State<PerformanceEnjeux> {

  late double _columnWidth;
  late double _columnSpacing;
  TooltipBehavior? _tooltipBehavior;
  bool isCardView = true;

  @override
  void initState() {
    _columnWidth = 0.8;
    _columnSpacing = 0.2;
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }


  Widget noDataWidget(String message){
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 40,
              icon: const Icon(Icons.refresh,color: Colors.green,),
              onPressed: () {},
              tooltip: "Réchager les données",
            ).scale(all: 1),
            const SizedBox(width: 50,),
            Center(child: Text("${message}",style: const TextStyle(fontSize: 20),))
          ]
      ),
    );
  }

  Widget loadingWidget(){
    return Center(child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SpinKitPouringHourGlassRefined(color: Colors.amber, size: 50.0,),
        SizedBox(width: 50,),
        Text("Veillez patienter SVP",style: TextStyle(fontSize: 20),)
      ],
    ),);
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return loadingWidget();
  }
}

class ChartSampleData {
  final String x;
  final double y;
  final double secondSeriesYValue;
  final double thirdSeriesYValue;
  ChartSampleData({required double this.thirdSeriesYValue, required String this.x, required double this.y, required double this.secondSeriesYValue,});
}
