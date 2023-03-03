import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:perf_rse/constants/colors.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';
import 'package:get/get.dart';

import '../../controllers/side_menu_controller.dart';


class SideMenuPilotage extends StatefulWidget {
  const SideMenuPilotage({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenuPilotage> createState() => _SideMenuPilotageState();
}

class _SideMenuPilotageState extends State<SideMenuPilotage> {

  final SideMenuController sideMenuController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset("assets/logos/perf_rse.png"),
          ),
          DrawerListTile(
            title: "Vue d'ensemble",
            svgScr: "",
            imgSrc: "assets/icons/home.png",
            press: () {
              sideMenuController.changeCurrentMenu("Vue d'ensemble");
              setState(() {

              });
            },
          ),
          DrawerListTile(
            title: "Tableau de Bord",
            svgScr: "",
            imgSrc: "assets/icons/table.png",
            press: () {
              sideMenuController.changeCurrentMenu("Tableau de Bord");
              setState(() {

              });
            },
          ),
          DrawerListTile(
            title: "Performances",
            svgScr: "assets/icons/menu_task.svg",
            imgSrc: "assets/icons/performance.png",
            press: () {
              sideMenuController.changeCurrentMenu("Performances");
              setState(() {

              });
            },
          ),
          DrawerListTile(
            title: "Suivi des données",
            svgScr: "assets/icons/menu_doc.svg",
            imgSrc: "assets/icons/monitoring.png",
            press: () {
              sideMenuController.changeCurrentMenu("Suivi des données");
              setState(() {
              });
            },
          ),
          DrawerListTile(
            title: "Profile",
            svgScr: "assets/icons/menu_profile.svg",
            imgSrc: "assets/icons/profil.png",
            press: () {
              sideMenuController.changeCurrentMenu("Profile");
              setState(() {

              });
            },
          ),
          DrawerListTile(
            title: "Notification",
            svgScr: "assets/icons/menu_notification.svg",
            imgSrc: "assets/icons/cloche.png",
            press: () {
              sideMenuController.changeCurrentMenu("Notification");
              setState(() {

              });
            },
          ),
          DrawerListTile(
            title: "Paramètres",
            svgScr: "assets/icons/menu_setting.svg",
            imgSrc: "assets/icons/admin.png",
            press: () {
              sideMenuController.changeCurrentMenu("Paramètres");
              setState(() {

              });
            },
          ),
          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 10,),
          DrawerListTile(
            title: "Accueil Pilotage",
            svgScr: "assets/icons/menu_profile.svg",
            imgSrc: "assets/icons/back.png",
            press: () {
              context.go('/pilotage');
            },
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.sunny,color: Colors.yellow,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Switcher(
                    value: false,
                    onTap: (){
                    },
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
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatefulWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.imgSrc,
    required this.press, required this.svgScr,
  }) : super(key: key);

  final String title, imgSrc,svgScr;
  final VoidCallback press;

  @override
  State<DrawerListTile> createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {

  final SideMenuController sideMenuController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.press,
      horizontalTitleGap: 0.0,
      leading: widget.imgSrc != "" ?  Image.asset(
        widget.imgSrc,
        height: 25,
        width: 25,
      ):SvgPicture.asset(
        widget.svgScr,
        color: Colors.amber,
        height: 25,
      ),
      title: Text(
        widget.title,
        style: TextStyle(color: sideMenuController.selectedMenu.value == widget.title ? Colors.amber : Colors.black),
      ),
    );
  }
}
