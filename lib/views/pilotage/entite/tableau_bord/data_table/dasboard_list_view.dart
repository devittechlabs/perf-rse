import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants_pilotages/controllers_pilotage.dart';
import 'dashboard_two.dart';

class DashBoardTable extends StatefulWidget {
  const DashBoardTable({Key? key}) : super(key: key);

  @override
  State<DashBoardTable> createState() => _DashBoardTableState();
}

class _DashBoardTableState extends State<DashBoardTable> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){
      var dataState = pDashBoardController.dropDownState.value;
      if (pTableauController.indicateurs.length == 0 ){
        return const Center(child: CircularProgressIndicator(),);
      }else{
        return Theme(
          data: Theme.of(context).copyWith(
              scrollbarTheme: ScrollbarThemeData(
                trackColor:  MaterialStateProperty.all(Colors.black12),
                trackBorderColor: MaterialStateProperty.all(Colors.black38),
                thumbColor: MaterialStateProperty.all(Colors.black),
                interactive: true,
              )
          ),
          child: Scrollbar(
            controller: _scrollController,
            thumbVisibility: true,
            thickness: 8,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: true),
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    children: [
                      DashBoardTwo(idPilier: "pilier0",title: "Général",color: Colors.brown,dropDownState: dataState["pilier0"],),
                      DashBoardTwo(idPilier: "pilier1",title: "Gouverance éthique",color: Color(0xFFEAB019),dropDownState: dataState["pilier1"]),
                      DashBoardTwo(idPilier: "pilier2",title: "Emploi & conditions de travail",color: Color(0xFF20ABE2),dropDownState: dataState["pilier2"]),
                      DashBoardTwo(idPilier: "pilier3",title: "Communauté et innovation sociétale",color: Color(0xFFE64F1A),dropDownState: dataState["pilier3"]),
                      DashBoardTwo(idPilier: "pilier4",title: "Préservation de l'environnement",color: Color(0xFF4AA83F),dropDownState: dataState["pilier4"])
                    ],
                  ),
                ),
              ),
            ),
          ),
        );}
    });
  }
}
