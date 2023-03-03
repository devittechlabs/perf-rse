import 'package:flutter/material.dart';
import 'package:perf_rse/widgets/custom_text.dart';
import 'widgets/export_dasboard_widget.dart';

class TableauDeBoardPilotage extends StatefulWidget {
  const TableauDeBoardPilotage({Key? key}) : super(key: key);

  @override
  State<TableauDeBoardPilotage> createState() => _TableauDeBoardPilotageState();
}

class _TableauDeBoardPilotageState extends State<TableauDeBoardPilotage> {
  bool searchIndicatorVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:  1000,//height - (60+40+20+8+4),
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EntityWidget(),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //DashBoardFiltre(),
              const Text("Barre de recherche "),
              IconButton(onPressed: (){
                setState((){
                  searchIndicatorVisibility = !searchIndicatorVisibility;
                });
              }, icon: Icon(searchIndicatorVisibility==true?Icons.visibility:Icons.visibility_off,color: Colors.grey,))

            ],
          ),
          Visibility(
            visible: searchIndicatorVisibility,
            child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: SearchIndicator(),
            ),
          ),
          const SizedBox(height: 5),
          //const DashBoardHeader(),
          //Expanded(child: DashBoardTable())
          Expanded(child: Container(
            child: const Center(
              child: CustomText(text: "Tableau de Bord",),
            ),
          ))
        ],
      ),
    );
  }
}
