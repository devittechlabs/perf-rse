import 'package:flutter/material.dart';

import '../../../widgets/copyright.dart';
import 'widgets/appbar_pilotage_home.dart';
import 'widgets/content_pilotage_home.dart';
import 'widgets/header_pilotage_home.dart';

class PilotageHome extends StatefulWidget {
  const PilotageHome({Key? key}) : super(key: key);

  @override
  State<PilotageHome> createState() => _PilotageHomeState();
}

class _PilotageHomeState extends State<PilotageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarPilotageHome(),
          Expanded(child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/background_image.jpg"), fit: BoxFit.fitWidth)),
            child: Column(
              children: const [
                HeaderPilotageHome(),
                Expanded(child: ContentPilotageHome())
              ],
            ),
          )),
          const CopyRight()
        ],
      ),
    );
  }
}
