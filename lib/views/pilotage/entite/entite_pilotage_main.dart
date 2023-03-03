import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:perf_rse/views/pilotage/controllers/side_menu_controller.dart';
import 'package:perf_rse/views/pilotage/entite/widgets/side_menu_pilotage.dart';
import '../../../helper/responsive.dart';
import 'dashboard/dashboard_screen.dart';
import 'package:get/get.dart';


class PilotageEntiteOverview extends StatefulWidget {
  const PilotageEntiteOverview({Key? key}) : super(key: key);

  @override
  State<PilotageEntiteOverview> createState() => _PilotageEntiteOverviewState();
}

class _PilotageEntiteOverviewState extends State<PilotageEntiteOverview> {

  final SideMenuController sideMenuController = Get.put(SideMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: sideMenuController.scaffoldKey,
      drawer: SideMenuPilotage(),
      body: SafeArea(child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context)) Expanded(flex : 1,child: SideMenuPilotage()),
          Expanded(
            // It takes 5/6 part of the screen
            flex: 5,
            child: DashboardScreen(),
          ),
        ],
      )),
    );
  }
}

