import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:perf_rse/modules/styled_scrollview.dart';

import '../../../../widgets/custom_text.dart';
import 'overview_card.dart';
import 'overview_item.dart';

class ContentPilotageHome extends StatefulWidget {
  const ContentPilotageHome({Key? key}) : super(key: key);

  @override
  State<ContentPilotageHome> createState() => _ContentPilotageHomeState();
}

class _ContentPilotageHomeState extends State<ContentPilotageHome> {
  ScrollController scrollController = ScrollController();
  double mheight = 150;
  double height = 200;
  double bHeight = 250;
  @override
  Widget build(BuildContext context) {
    return StyledScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Wrap(
            spacing: 10,
            runSpacing: 4.0,
            children: [
              // Consolidation Groupe
              SizedBox(
                height: 200,
                width: 300,
                child: OverviewCard(
                  title: "Consolidation Groupe",
                  titleColor: const Color(0xffb66600),
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const CustomText(
                          text: "COMEX",
                          color: Color(0xffb66600),
                          weight: FontWeight.bold,
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const CustomText(
                          text: "GROUPE SIFCA",
                          color: Color(0xffb66600),
                          weight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              // Oléagineux
              SizedBox(
                width: 300,
                child: OverviewCard(
                  title: "Oléagineux",
                  titleColor: Colors.red,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const CustomText(
                          text: "SANIA",
                          color: Colors.red,
                          weight: FontWeight.bold,
                        )
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const CustomText(
                          text: "MOPP",
                          color: Colors.red,
                          weight: FontWeight.bold,
                        )
                    ),
                    OverviewExpansionItem(
                      onPressed: (){},
                      title: "PALMCI",
                      titleColor: Colors.red,
                      children: [
                        TextButton(
                            onPressed: () {
                            },
                            child: const CustomText(
                              text: "Palcmi Siège",
                              weight: FontWeight.bold,
                            )),
                        TextButton(
                            onPressed: () {
                            },
                            child: const CustomText(
                              text: "Ehania",
                              weight: FontWeight.bold,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const CustomText(
                              text: "Irobo",
                              weight: FontWeight.bold,
                            )),
                        TextButton(
                            onPressed: () {
                            },
                            child: const CustomText(
                              text: "Iboké",
                              weight: FontWeight.bold,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const CustomText(
                              text: "Neka",
                              weight: FontWeight.bold,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const CustomText(
                              text: "Gbapet",
                              weight: FontWeight.bold,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const CustomText(
                              text: "Toumanguié",
                              weight: FontWeight.bold,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const CustomText(
                              text: "Blidouba",
                              weight: FontWeight.bold,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const CustomText(
                              text: "Boubo",
                              weight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              // Catouchou Naturel
              SizedBox(
                width: 300,
                child: OverviewCard(
                  title: "Catouchou Naturel",
                  titleColor: Colors.green,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const CustomText(
                          text: "SIPH",
                          color: Colors.green,
                          weight: FontWeight.bold,
                        )
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const CustomText(
                          text: "CRC",
                          color: Colors.green,
                          weight: FontWeight.bold,
                        )
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const CustomText(
                          text: "GREL",
                          color: Colors.green,
                          weight: FontWeight.bold,
                        )
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const CustomText(
                          text: "RENL",
                          color: Colors.green,
                          weight: FontWeight.bold,
                        )
                    ),
                    OverviewExpansionItem(
                      title: "SAPH",
                      titleColor: Colors.green,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const CustomText(
                              text: "SAPH Siège",
                              weight: FontWeight.bold,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const CustomText(
                              text: "Béttié",
                              weight: FontWeight.bold,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const CustomText(
                              text: "Bongo",
                              weight: FontWeight.bold,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const CustomText(
                              text: "PH/CC",
                              weight: FontWeight.bold,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const CustomText(
                              text: "Rapides-Grah",
                              weight: FontWeight.bold,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const CustomText(
                              text: "Toupah",
                              weight: FontWeight.bold,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const CustomText(
                              text: "Yacoli",
                              weight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              // Sucre
              SizedBox(
                height: 200,
                width: 300,
                child: OverviewCard(
                  title: "Sucre",
                  titleColor: Colors.blue,
                  children: [
                    OverviewExpansionItem(
                      title: "SUCRIVOIRE",
                      titleColor: Colors.blue,
                      onPressed: (){
                        setState(() {

                        });
                      },
                      children: [
                        TextButton(
                            onPressed: () {
                              context.go('/pilotage/accueil/entite');
                            },
                            child: const CustomText(
                              text: "Sucrivoire-Siège",
                              weight: FontWeight.bold,
                              isTooltip: true,
                            )),
                        TextButton(
                            onPressed: () {

                            },
                            child: const CustomText(
                              text: "Sucrivoire-Borotou-Koro",
                              weight: FontWeight.bold,
                            )),
                        TextButton(
                            onPressed: () {

                            },
                            child: const CustomText(
                              text: "Sucrivoire-Zuénoula",
                              weight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              // Outils des Dirigeants
              SizedBox(
                height: mheight,
                width: 300,
                child: OverviewCard(
                  title: "Outils des Dirigeants",
                  titleColor: Colors.black,
                  children: [
                    TextButton(
                        onPressed: () {
                          //showAlert("Vous n'avvez pas accès à cet espace", Icon(Icons.warning,color: Colors.red,size: 25,));
                        },
                        child: const CustomText(
                          text: "Feuille de Route",
                          color: Colors.black,
                          weight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              // Consolidaltion Filières
              SizedBox(
                height: mheight,
                width: 300,
                child: OverviewCard(
                  title: "Consolidaltion Filières",
                  titleColor: const Color(0xffb66600),
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const CustomText(
                          text: "Oléagineux",
                          color: Colors.red,
                          weight: FontWeight.bold,
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const CustomText(
                          text: "Sucre",
                          color: Colors.blue,
                          weight: FontWeight.bold,
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const CustomText(
                          text: "Catouchou Naturel",
                          color: Colors.green,
                          weight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
              // SIFCA HOLDING
              SizedBox(
                height: mheight,
                width: 300,
                child: OverviewCard(
                  title: "SIFCA HOLDING",
                  titleColor: Colors.grey,
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          //showAlert("Vous n'avvez pas accès à cet espace", Icon(Icons.warning,color: Colors.red,size: 25,));
                        },
                        icon: Image.asset("assets/logos/logo_sifca_bon.png",width: 40,height: 30,),
                        label: const CustomText(
                          text: "Administration",
                          color: Colors.grey,
                          weight: FontWeight.bold,
                        )),
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

class Element extends StatelessWidget {
  const Element({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      color: Colors.red,
    );
  }
}

