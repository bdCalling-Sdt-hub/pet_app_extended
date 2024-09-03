import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/more_resources_controller.dart';

class MoreResourcesView extends GetView<MoreResourcesController> {
  const MoreResourcesView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('MoreResourcesView'.tr),
        centerTitle: true,
      ),

      body:  Center(
        child: Text(
          'MoreResourcesView is working'.tr,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
