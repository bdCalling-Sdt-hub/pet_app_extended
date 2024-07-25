import 'package:felpus/app/modules/adoption/views/adoption_view.dart';
import 'package:felpus/app/modules/groups/views/groups_view.dart';
import 'package:felpus/app/modules/home/views/home_view.dart';
import 'package:felpus/app/modules/lost_pets/views/lost_pets_view.dart';
import 'package:felpus/app/modules/menu/views/menu_view.dart';
import 'package:felpus/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
