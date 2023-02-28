import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/colors.dart';
import '../../../../widgets/custom_text.dart';

class HeaderRessourcePilotage extends StatefulWidget {
  const HeaderRessourcePilotage({Key? key}) : super(key: key);

  @override
  State<HeaderRessourcePilotage> createState() => _HeaderRessourcePilotageState();
}

class _HeaderRessourcePilotageState extends State<HeaderRessourcePilotage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 20,right: 20),
      color: headerApp,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/logos/perf_rse.png",
                height: 50,
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: (){
                  context.go('/pilotage');
                },
                child: const CustomText(
                  text: "Pilotage RSE",
                  color: Colors.black,
                  weight: FontWeight.bold,
                  size: 30,
                ),
              ),
              const CustomText(
                text: " / Ressources ",
                color: Colors.black,
                weight: FontWeight.bold,
                size: 30,
              )
            ],
          ),
          TextButton(
            child: const Text(
              "A propos de Perf RSE",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  decoration: TextDecoration.underline),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
