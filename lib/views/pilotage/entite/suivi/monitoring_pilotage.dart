import 'package:flutter/material.dart';
import '../../../../modules/styled_scrollview.dart';
import 'widgets/entete_monitoring_pilotage.dart';
import 'widgets/export_monitoring_widget.dart';

class MonitoringPilotage extends StatefulWidget {
  const MonitoringPilotage({Key? key}) : super(key: key);

  @override
  State<MonitoringPilotage> createState() => _MonitoringPilotageState();
}

class _MonitoringPilotageState extends State<MonitoringPilotage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints constraints) {
          return Visibility(
            visible: constraints.maxWidth < 1200 ? false : true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  width: constraints.maxWidth,
                  child: const EnteteMonitoring(),
                ),
                Expanded(
                  child: StyledScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              SizedBox(
                                width: 600,
                                child: Card(elevation: 5, child: SizedBox(
                                  height: 300,
                                  child: StatistiqueSuiviCollecte()
                                ),),
                              ),
                              Expanded(flex:5,child: Card(
                                elevation: 5,
                                child: SizedBox(height:300,child: TableCollecteFiliale()),
                              ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 320,
                          width: double.infinity,
                          child:  Card(
                            child: DiagramCollecteFiliale(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
