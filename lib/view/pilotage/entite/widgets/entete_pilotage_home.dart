import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/custom_text.dart';

class EntetePilotageHome extends AppBar {
  EntetePilotageHome({Key? key}) : super(key: key);

  @override
  State<EntetePilotageHome> createState() => _EntetePilotageHomeState();
}

class _EntetePilotageHomeState extends State<EntetePilotageHome> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFAAA095),
      elevation: 0.0,
      leading: Image.asset(
        "assets/logos/logo_sifca.jpg",
        height: 200,
        width: 200,
      ),
      title: const Text(
        "Perfromance RSE ",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      actions: [
        Center(
          child: CustomText(
            text: "Fabrice H.",
            color: Colors.white,
            weight: FontWeight.bold,
            size: 15,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        /*QudsPopupButton(
            items: getMenuItems(),
            child: CircleAvatar(
              backgroundColor: Color(0xFFFFFF00),
              child: Center(
                child: CustomText(
                  text: avatarString,
                  color: Color(0xFFF1C232),
                  weight: FontWeight.bold,
                ),
              ),
            )),*/
        const SizedBox(width: 30,),
        TextButton(
          child: const Text(
            "A propos de Perf RSE",
            style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),),
          onPressed: () {},
        ),
        const SizedBox(
          width: 30,
        ),
      ],
    );
  }
}


/*
List<QudsPopupMenuBase> getMenuItems() {
  String avatarString = "";
  if (userController.user.nom != null || userController.user.prenom != null ){
    avatarString = userController.user.nom![0]+userController.user.prenom![0];
  }
  return [
    QudsPopupMenuItem(
        leading: CircleAvatar(
          backgroundColor: Color(0xFFFFFF00),
          child: Center(
            child: CustomText(
              text: avatarString,
              color: Color(0xFFF1C232),
              weight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          '${userController.user.prenom} ${userController.user.nom}',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        subTitle: Text('${userController.user.email}'),
        onPressed: () {}),
    QudsPopupMenuDivider(),
    QudsPopupMenuItem(
        leading: const Icon(Icons.person,color: Colors.blue,size: 30,),
        title: Text(
          'Mon Profil',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        subTitle: Text('Informations du compte et plus'),
        onPressed: () {
          pSideMenuController.changeCurrentRoute(0);
          pNavigationController.navigateTo("pilotage/profile");
        }),
    QudsPopupMenuWidget(
        builder: (c) => Container(
            padding: EdgeInsets.all(10),
            width: 200,
            child: IntrinsicHeight(
              child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: Get.context!,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Voulez-vous quitter cette application ?'),
                          content: SizedBox(width:200,child: Text('On somme désolé te voir partir...')),
                          actionsAlignment: MainAxisAlignment.spaceBetween,
                          actions: <Widget>[
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Non'),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Get.toNamed("/login");
                              },
                              child: Text('Oui'),
                            ),
                          ],
                        );
                      },);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    shape: const StadiumBorder(),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const CustomText(
                      text: "Se déconnecter",
                      color: Colors.white,
                    ),
                  )),
            )))
  ];
}*/
