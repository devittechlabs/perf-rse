import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:perf_rse/widgets/custom_text.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';
import 'package:get/get.dart';

import '../../controllers/side_menu_controller.dart';



class SideMenuPilotage extends StatefulWidget {
  final String currentPath;
  const SideMenuPilotage({
    Key? key, required this.currentPath,
  }) : super(key: key);

  @override
  State<SideMenuPilotage> createState() => _SideMenuPilotageState();
}

class _SideMenuPilotageState extends State<SideMenuPilotage> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                child: Image.asset("assets/logos/perf_rse.png"),
              ),
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(text: "Menu du Pilotage",size: 20,weight: FontWeight.bold,),
              ),
              DrawerListTile(
                menuPath: "vue-ensemble",
                currentPath: widget.currentPath,
                title: "Vue d'ensemble",
                svgScr: "",
                imgSrc: "assets/icons/home.png",
                press: () {
                  context.go('/pilotage/entite/vue-ensemble');
                },
              ),
              DrawerListTile(
                title: "Tableau de Bord",
                menuPath: "tableau-de-bord",
                currentPath: widget.currentPath,
                svgScr: "",
                imgSrc: "assets/icons/table.png",
                press: () {
                  context.go('/pilotage/entite/tableau-de-bord');
                },
              ),
              DrawerListTile(
                title: "Performances",
                menuPath: "performances",
                currentPath: widget.currentPath,
                svgScr: "assets/icons/menu_task.svg",
                imgSrc: "assets/icons/performance.png",
                press: () {
                  context.go('/pilotage/entite/performances');
                },
              ),
              DrawerListTile(
                title: "Suivi des données",
                menuPath: "suivi-des-donnees",
                currentPath: widget.currentPath,
                svgScr: "assets/icons/menu_doc.svg",
                imgSrc: "assets/icons/monitoring.png",
                press: () {
                  context.go('/pilotage/entite/suivi-des-donnees');
                },
              ),
              DrawerListTile(
                title: "Profil",
                menuPath: "profil",
                currentPath: widget.currentPath,
                svgScr: "assets/icons/menu_profile.svg",
                imgSrc: "assets/icons/profil.png",
                press: () {
                  context.go('/pilotage/entite/profil');
                },
              ),
              DrawerListTile(
                title: "Notification",
                menuPath: "notification",
                currentPath: widget.currentPath,
                svgScr: "assets/icons/menu_notification.svg",
                imgSrc: "assets/icons/cloche.png",
                press: () {
                },
              ),
              DrawerListTile(
                title: "Paramètres",
                menuPath: "admin",
                currentPath: widget.currentPath,
                svgScr: "assets/icons/menu_setting.svg",
                imgSrc: "assets/icons/admin.png",
                press: () {
                  context.go('/pilotage/entite/admin');
                },
              ),
              SizedBox(height: 10,),
              Divider(),
              SizedBox(height: 10,),
              DrawerListTile(
                title: "Accueil Pilotage",
                menuPath: "",
                currentPath: widget.currentPath,
                svgScr: "assets/icons/menu_profile.svg",
                imgSrc: "assets/icons/back.png",
                press: () {
                  context.go('/pilotage');
                },
              ),
              SizedBox(height: 10,),
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
        ),
      ),
    );
  }
}

class DrawerListTile extends StatefulWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title, required this.imgSrc,
    required this.press, required this.svgScr,
    required this.menuPath, required this.currentPath,
  }) : super(key: key);

  final String title, imgSrc,svgScr,menuPath,currentPath;
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
        style: TextStyle(color: widget.menuPath == widget.currentPath ? Colors.amber : Colors.black,
            fontWeight: widget.menuPath == widget.currentPath ? FontWeight.bold: FontWeight.normal),
      ),
    );
  }
}
