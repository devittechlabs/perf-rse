import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';


class PerformPilotage extends StatefulWidget {
  const PerformPilotage({Key? key}) : super(key: key);

  @override
  State<PerformPilotage> createState() => _PerformPilotageState();
}

class _PerformPilotageState extends State<PerformPilotage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:  1000,//height - (60+40+20+8+4),
      padding: const EdgeInsets.all(defaultPadding),
    );
  }
}