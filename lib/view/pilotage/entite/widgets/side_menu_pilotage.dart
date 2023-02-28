import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:perfrse/constants/main_controllers.dart';
import 'package:perfrse/pilotage/controllers_pilotage/export_pilotage_controllers.dart';
import 'package:perfrse/widgets/custom_text.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';

import '../../../../widgets/custom_text.dart';
import '../../../constants_pilotages/controllers_pilotage.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();

}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 240,
        height: double.maxFinite,
        child: Card(
          shadowColor: Color(0xFFE8E8E8),
          elevation: 2,
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: Column(
              children: [
                Container(
                  height: 40,
                  child: const Center(
                    child: CustomText(
                      text: "Menu Principal",
                      size: 20,
                      weight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                Expanded(
                    child: SingleChildScrollView(
                      child: Padding(padding: const EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            ButtonSideMenu(title: "Acceuil",icon: Icons.home,index: 1,function: (){
                              if(pSideMenuController.currentRouteIndex.value != 1){
                                pSideMenuController.changeCurrentRoute(1);
                                pNavigationController.navigateTo("pilotage/acceuil");
                              }
                            }),
                            ButtonSideMenu(title: "Performances",icon: Icons.show_chart,index: 2,function: (){
                              if(pSideMenuController.currentRouteIndex.value != 2){
                                pSideMenuController.changeCurrentRoute(2);
                                pNavigationController.navigateTo("pilotage/perform");
                              }
                            },),
                            ButtonSideMenu(title: "Tableau de Bord",icon: Icons.table_chart,index: 3,function: (){
                              if(pSideMenuController.currentRouteIndex.value != 3){
                                pSideMenuController.changeCurrentRoute(3);
                                pNavigationController.navigateTo("pilotage/tbd");
                              }
                            },),
                            ButtonSideMenu(title: "Suivi des Indicateurs",icon: Icons.monitor,index: 4,function: (){
                              if(pSideMenuController.currentRouteIndex.value != 4){
                                pSideMenuController.changeCurrentRoute(4);
                                pNavigationController.navigateTo("pilotage/suivi");
                              }
                            },),
                            if (userController.user.accesPilotage?.estAdmin == true)
                            ButtonSideMenu(title: "Administration",icon: Icons.group_sharp,index: 5,function: (){
                              if(pSideMenuController.currentRouteIndex.value != 5){
                                pSideMenuController.changeCurrentRoute(5);
                                pNavigationController.navigateTo("pilotage/admin");
                              }
                            },),
                            Divider(),
                            ButtonSideMenu(title: "Français",icon: Icons.language,function: null,),
                            ButtonSideMenu(title: "Acceuil Générale",icon: Icons.arrow_circle_left_sharp,function: (){
                              Get.offAllNamed("/home");
                            },),
                            SizedBox(height: 40,),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.sunny,color: Colors.yellow,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Switcher(
                                      value: false,
                                      size: SwitcherSize.medium,
                                      switcherButtonRadius: 50,
                                      enabledSwitcherButtonRotate: true,
                                      iconOff: Icons.circle_outlined,
                                      iconOn: Icons.circle_outlined,
                                      colorOff: Colors.yellow,
                                      colorOn: Colors.black,
                                      onChanged: (bool state) {
                                        //
                                      },
                                    ),
                                  ),
                                  Icon(Iconsax.moon,color: Colors.black,)
                                ],
                              ),
                            )
                          ],
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonSideMenu extends StatefulWidget {
  const ButtonSideMenu({Key? key, required this.title,required this.icon,
    required this.function,@required this.index}) : super(key: key);

  final String title;
  final IconData icon;
  final Function()? function;
  final int? index;

  @override
  State<ButtonSideMenu> createState() => _ButtonSideMenuState();
}

class _ButtonSideMenuState extends State<ButtonSideMenu> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PilotageSideMenuController>(
        builder: (s) => Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: widget.index!= null? widget.index == s.currentRouteIndex.value ? BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.yellow.withOpacity(0.9),
                Colors.grey.withOpacity(0.9),
              ],
            ),
          ) : null : null,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            hoverColor: Color(0xFFAAA095),
            title: Text(
              widget.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                widget.icon,
                color: Colors.black,
              ),
            ),
            onTap: widget.function,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        )
    );
  }
}
