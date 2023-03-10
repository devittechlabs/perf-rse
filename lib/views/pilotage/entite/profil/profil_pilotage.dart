import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../constants/colors.dart';
import '../../../../widgets/custom_text.dart';
import 'widgets/export_widget_profile.dart';

class ProfilPilotage extends StatefulWidget {
  const ProfilPilotage({Key? key}) : super(key: key);

  @override
  State<ProfilPilotage> createState() => _ProfilPilotageState();
}

class _ProfilPilotageState extends State<ProfilPilotage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Places'),
    Tab(text: 'Inspiration'),
    Tab(text: 'Emotions'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: myTabs.length, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TabController tabController = TabController(length: 3, vsync: this);
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      child: LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        return Visibility(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  //padding: const EdgeInsets.all(8.0),
                  width: double.maxFinite,
                  //height: constraints.maxHeight,
                  child: ContainedTabBarView(
                    tabBarViewProperties: const TabBarViewProperties(
                      physics: BouncingScrollPhysics(),
                      dragStartBehavior: DragStartBehavior.start,
                    ),
                    tabBarProperties: TabBarProperties(
                        alignment: TabBarAlignment.start,
                        isScrollable: true,
                        labelColor: Colors.black,
                        labelPadding:
                            const EdgeInsets.only(left: 0, right: 30),
                        unselectedLabelColor: Colors.amber,
                        indicator: MaterialIndicator(
                          color: Colors.amber,
                          paintingStyle: PaintingStyle.fill,
                        )),
                    tabs: const [
                      CustomText(
                        text: "Informations Personnelles",
                        size: 15,
                      ),
                      CustomText(
                        text: "Informations du Compte",
                        size: 15,
                      ),
                      CustomText(
                        text: "Modifier mon mot de passe",
                        size: 15,
                      ),
                    ],
                    views: [
                      Container(
                        child: InfosPilote(),
                      ),
                      Container(
                        child: InfosCompte(),
                      ),
                      Container(
                        child: PasswordPilote(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
