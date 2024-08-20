
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/screens/adoption/adoption_view.dart';
import '../views/screens/groups/groups_view.dart';
import '../views/screens/home/home_view.dart';
import '../views/screens/lost_pets/lost_pets_view.dart';
import '../views/screens/menu/views/menu_view.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> allScreens = <Widget>[
    HomeView(),
    LostPetsView(),
    AdoptionView(),
    GroupsView(),
    MenuView()
  ];
}
