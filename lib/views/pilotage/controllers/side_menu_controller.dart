import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenuController extends GetxController {
  var selectedMenu = "Vue d'ensemble".obs;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
  void changeCurrentMenu(String titleMenu){
    selectedMenu.value = titleMenu;
  }
}