import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/auth_controller.dart';
import '../../../widgets/export_widget.dart';
import 'widget/banniere.dart';
import 'widget/custom_cadre.dart';
import 'widget/header_main_page.dart';
import '../../../modules/styled_scrollview.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final AuthController authController  = Get.find();
  final box = GetStorage();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: headerMainPage(name:"Fabrice HOUESSOU"),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/background_image.jpg"),
                        fit: BoxFit.fitWidth)),
                child: StyledScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                      text: "Bienvenue dans ",
                                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(text: "Performance ",style: TextStyle(color: Color(0xFF2A9836))),
                                        TextSpan(text: "RSE",style: TextStyle(color: Color(0xFF0F70B7))),
                                      ]
                                  ),
                                ),
                                Image.asset(
                                  "assets/logos/logo_sifca_bon.png",
                                  height: 50,
                                  width: 200,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Center(child: Banniere()),
                            const SizedBox(
                              height: 10,
                            ),
                            //Text("${MediaQuery.of(context).size.height} x ${MediaQuery.of(context).size.width}"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomCadre(
                                  onTap: () async {},
                                  imagePath: "assets/images/audit_rse.png",
                                  titreCadre: "Evaluation",
                                ),
                                CustomCadre(
                                  onTap: (){
                                    context.go('/pilotage');
                                  },
                                  imagePath: "assets/images/pilotage_rse.jpg",
                                  titreCadre: "Pilotage",
                                ),
                                CustomCadre(
                                  onTap: (){},
                                  imagePath: "assets/images/reporting_rse.jpg",
                                  titreCadre: "Reporting",
                                ),
                              ],
                            )
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: IconButton(
                              tooltip: "Se déconnecter",
                              alignment: Alignment.center,
                              padding: EdgeInsets.zero,
                              style: IconButton.styleFrom(
                                iconSize: 50
                              ),
                              icon: Icon(
                                Icons.exit_to_app_outlined,
                                color: Colors.red,
                                size: 50,
                              ),
                              onPressed: () async {
                                box.remove('isLogin');
                                context.go('/accounts/login');
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const CopyRight()
          ],
        ),
      ),
    );
  }
}
