import 'package:flutter/material.dart';

import '../../../../../../constants/colors.dart';

class PilierInfoModel {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  PilierInfoModel({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoPiliers = [
  PilierInfoModel(
    title: "Gouvernance",
    numOfFiles: 50,
    svgSrc: "assets/icons/gouvernance.png",
    totalStorage: "125",
    color: Colors.purple,
    percentage: 35,
  ),
  PilierInfoModel(
    title: "Economie",
    numOfFiles: 28,
    svgSrc: "assets/icons/economie.png",
    totalStorage: "120",
    color: Color(0xFF007EE5),
    percentage: 35,
  ),
  PilierInfoModel(
    title: "Social",
    numOfFiles: 13,
    svgSrc: "assets/icons/social.png",
    totalStorage: "140",
    color: Colors.amber,
    percentage: 10,
  ),
  PilierInfoModel(
    title: "Environnement",
    numOfFiles: 53,
    svgSrc: "assets/icons/environnement.png",
    totalStorage: "70",
    color: Colors.green,
    percentage: 78,
  ),
];
