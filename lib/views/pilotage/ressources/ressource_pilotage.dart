import 'package:flutter/material.dart';
import 'package:perf_rse/constants/colors.dart';
import 'package:perf_rse/widgets/copyright.dart';

import 'widgets/content_ressource_pilotage.dart';
import 'widgets/header_ressource_pilotage.dart';
import 'widgets/title_ressource_pilotage.dart';

class RessourcePilotage extends StatefulWidget {
  const RessourcePilotage({Key? key}) : super(key: key);

  @override
  State<RessourcePilotage> createState() => _RessourcePilotageState();
}

class _RessourcePilotageState extends State<RessourcePilotage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderRessourcePilotage(),
          Expanded(child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/background_image.jpg"),
                    fit: BoxFit.fitWidth)),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TitleRessourcePilotage(),
                  SizedBox(height: 5,),
                  Expanded(child: Container(
                    child: ContentRessourcePilotage(),
                  ))
                ],
              ),
            ),
          )),
          CopyRight()
        ],
      ),
    );
  }
}
