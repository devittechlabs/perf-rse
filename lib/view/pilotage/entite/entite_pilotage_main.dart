import 'package:flutter/material.dart';
import '../../../widgets/copyright.dart';
import 'widgets/PilotageMainContent.dart';
import 'widgets/entete_pilotage_home.dart';
import 'widgets/side_menu_pilotage.dart';

class PilotageOverview extends StatefulWidget {
  const PilotageOverview({Key? key}) : super(key: key);

  @override
  State<PilotageOverview> createState() => _PilotageOverviewState();
}

class _PilotageOverviewState extends State<PilotageOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EntetePilotageHome(),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/background_image.jpg",)
            )
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SideMenu(),
                  Expanded(child: PilotageMainContent())
                ],
              ),
            ),
            CopyRight(),
          ],
        ),
      ),
    );
  }
}
