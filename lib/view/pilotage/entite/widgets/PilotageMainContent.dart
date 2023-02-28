import 'package:flutter/material.dart';

class PilotageMainContent extends StatefulWidget {
  const PilotageMainContent({Key? key}) : super(key: key);

  @override
  State<PilotageMainContent> createState() => _PilotageMainContentState();
}

class _PilotageMainContentState extends State<PilotageMainContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0,top: 4.0,bottom: 8.0),
      child: localNavigatorPilotage(),
    );
  }
}
