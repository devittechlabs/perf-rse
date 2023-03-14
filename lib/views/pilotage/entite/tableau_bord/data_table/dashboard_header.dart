import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants_pilotages/controllers_pilotage.dart';

class DashBoardHeader extends StatefulWidget {
  const DashBoardHeader({Key? key}) : super(key: key);

  @override
  State<DashBoardHeader> createState() => _DashBoardHeaderState();
}

class _DashBoardHeaderState extends State<DashBoardHeader> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Container(
        height: 30,
        width: double.maxFinite,
        color: Colors.brown,
        child: Row(
          children: [
            DashBoardHeaderTitle(color: Colors.brown, size: 120,title: "Réf",),
            DashBoardHeaderTitle(color: Colors.brown, size: 420,title: "Intitulé",),
            DashBoardHeaderTitle(color: Colors.brown, size: 170,title: "Processus",),
            DashBoardHeaderTitle(color: Colors.brown, size: 150,title: "Réalisé ${pDashBoardController.currentYear.value}",),
            DashBoardHeaderTitle(color: Colors.brown, size: 170,title: "${pDashBoardController.currentMonth.value}",),
            DashBoardHeaderTitle(color: Colors.brown, size: 100,title: "Cible",),
            DashBoardHeaderTitle(color: Colors.brown, size: 90,title: "Ecart",),
          ],
        ),
      ),
    ));
  }
}

class DashBoardHeaderTitle extends StatefulWidget {
  final double size;
  final Color color;
  final String title;
  const DashBoardHeaderTitle({Key? key, required this.size, required this.color, required this.title}) : super(key: key);

  @override
  State<DashBoardHeaderTitle> createState() => _DashBoardHeaderTitleState();
}

class _DashBoardHeaderTitleState extends State<DashBoardHeaderTitle> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      onHover: (value){
        setState(() {
          isHovering = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.only(left: 2.0),
        width: widget.size,
        color: isHovering ? Color(0xFF8B735C) :widget.color,
        alignment: Alignment.centerLeft,
        child: Text("${widget.title}",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
      ),
    );
  }
}

