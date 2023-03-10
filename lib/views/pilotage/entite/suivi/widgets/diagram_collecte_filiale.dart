import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';


class DiagramCollecteFiliale extends StatefulWidget {
  const DiagramCollecteFiliale({Key? key}) : super(key: key);

  @override
  State<DiagramCollecteFiliale> createState() => _DiagramCollecteFilialeState();
}

class _DiagramCollecteFilialeState extends State<DiagramCollecteFiliale> {
  bool isCardView = true;

  List<DiagramCollecteData>? chartData;

  TooltipBehavior? _tooltipBehavior;

  Widget noDataWidget(String message){
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(iconSize: 40,icon: Icon(Icons.refresh,color: Colors.green,),
              onPressed: () {
              },tooltip: "Réchager les données",).scale(all: 1),
            SizedBox(width: 50,),
            Center(child: Text("${message}",style: TextStyle(fontSize: 20),))
          ]
      ),
    );
  }


  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true, header: '', canShowMarker: false);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }

}

class DiagramCollecteData {
  final String x;
  final double y;
  final double yValue;
  final double secondSeriesYValue;
  DiagramCollecteData({required String this.x, required double this.y,required double this.yValue, required double this.secondSeriesYValue,});
}
