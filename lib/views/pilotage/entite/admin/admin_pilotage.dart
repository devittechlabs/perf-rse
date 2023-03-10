import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../widgets/custom_text.dart';
import 'widgets/entity_admin_pilotage.dart';
import 'widgets/indicator_admin_pilotage.dart';
import 'widgets/user_admin_pilotage/user_admin_pilotage.dart';

class AdministrationPilotage extends StatefulWidget {
  final routeName;
  const AdministrationPilotage({Key? key, this.routeName}) : super(key: key);

  @override
  State<AdministrationPilotage> createState() => _AdministrationPilotageState();
}

class _AdministrationPilotageState extends State<AdministrationPilotage> with SingleTickerProviderStateMixin {

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Places'),
    Tab(text: 'Inspiration'),
    Tab(text: 'Emotions'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length,initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TabController tabController = TabController(length: 3, vsync: this);
    return Padding(
        padding: EdgeInsets.only(top: 15),
        child: LayoutBuilder(
            builder: (BuildContext ctx, BoxConstraints constraints) {
              return Visibility(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        CustomText(text: "Pilotage",size: 20,weight: FontWeight.bold,),
                        SizedBox(width: 2,),
                        Icon(Icons.group_add_rounded,size: 30,),
                        SizedBox(width: 10,),
                        CustomText(text: "Centre d'adaminsistration",color: Colors.grey,)
                      ],
                    ),
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
                              labelPadding: const EdgeInsets.only(left: 0,right: 30),
                              unselectedLabelColor: Colors.amber,
                              indicator: MaterialIndicator(
                                color: Colors.amber,
                                paintingStyle: PaintingStyle.fill,
                              )
                          ),
                          tabs: const [
                            CustomText(text: "Gestion des utilisateurs",size: 15,),// Ajjouter , Modifier , Suppression d'itilisateur et acces
                            CustomText(text: "Gestion des indicateurs",size:15 ,),// Gestion de la base de données d'indicateurs
                            CustomText(text: "Gestion des Filiales et Entités",size:15,),
                          ],
                          views: [
                            UserAdmin(),
                            IndicatorAdmin(),
                            EntityAdmin()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
        )
    );
  }
}



