import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../../widgets/custom_text.dart';

class TableCollecteFiliale extends StatefulWidget {
  const TableCollecteFiliale({Key? key}) : super(key: key);

  @override
  State<TableCollecteFiliale> createState() => _TableCollecteFilialeState();
}

class _TableCollecteFilialeState extends State<TableCollecteFiliale> {


  Widget waitingWidget(int option){
     return Center(child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: const [
         SpinKitPouringHourGlassRefined(
           color: Colors.amber, size: 50.0,),
         SizedBox(width: 50,),
         Text("Veillez patienter SVP",style: TextStyle(fontSize: 20),)
       ],
     ),);
  }
  @override
  void initState() {
    super.initState();
  }

  Widget noDataWidget(String message){
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(iconSize: 40,icon: Icon(Icons.refresh,color: Colors.green,),
              onPressed: () {}, tooltip: "Réchager les données",).scale(all: 1),
            const SizedBox(width: 50,),
            Center(child: Text("${message}",style: TextStyle(fontSize: 20),))
          ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
          alignment: AlignmentDirectional.center,
          children: const [
            SizedBox(height:100,width: 100,child: CircularProgressIndicator(color: Colors.grey,strokeWidth: 8,)),
            SizedBox(height:50,width: 50,child: CircularProgressIndicator(color: Colors.amber,strokeWidth: 8)),
          ],
        );
  }

}
