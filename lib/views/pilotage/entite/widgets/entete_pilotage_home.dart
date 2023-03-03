import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';
import '../../../../constants/colors.dart';
import '../../../../widgets/custom_text.dart';

class AppBarEntiteHome extends StatefulWidget {
  const AppBarEntiteHome({Key? key}) : super(key: key);

  @override
  State<AppBarEntiteHome> createState() => _AppBarEntiteHomeState();
}

class _AppBarEntiteHomeState extends State<AppBarEntiteHome> {
  var avatarString = "HH";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: headerApp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(width: 20,),
              IconButton(
                splashRadius: 25,
                padding: EdgeInsets.zero,onPressed: (){},
                icon: Icon(Icons.menu,size: 30,color: Colors.white,),
              ),
              SizedBox(width: 20,),
              InkWell(
                onTap: (){
                  context.go('/');
                },
                child: Tooltip(
                  message: "Accueil Générale Perf RSE",
                  child: Image.asset(
                    "assets/logos/perf_rse.png",
                    height: 50,
                  ),
                ),
              ),
              SizedBox(width: 20,),
              const Text(
                "Sucrivoire Siège",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
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
              QudsPopupButton(
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
                  )),
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
          )
        ],
      ),
    );
  }

  List<QudsPopupMenuBase> getMenuItems() {
    String avatarString = "HH";
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
          title: const Text(
            'Fabrice HOUESSOU',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          subTitle: Text('fabdev6@gmail.com'),
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
  }
}





