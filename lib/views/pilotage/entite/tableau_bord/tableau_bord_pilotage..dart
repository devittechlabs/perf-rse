import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class TableauBordPilotage extends StatefulWidget {
  const TableauBordPilotage({Key? key}) : super(key: key);

  @override
  State<TableauBordPilotage> createState() => _TableauBordPilotageState();
}

class _TableauBordPilotageState extends State<TableauBordPilotage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  1000,//height - (60+40+20+8+4),
      padding: const EdgeInsets.all(defaultPadding),
    );
  }
}

