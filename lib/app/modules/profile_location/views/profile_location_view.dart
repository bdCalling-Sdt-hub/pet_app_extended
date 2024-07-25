import 'package:felpus/app/modules/profile_location/controllers/profile_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileLocationView extends GetView<ProfileLocationController> {
  const ProfileLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ModuleName View'),
      ),
      body: Center(
        child: Text('ModuleName View is working'),
      ),
    );
  }
}
