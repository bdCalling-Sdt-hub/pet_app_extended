import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/more_resources_controller.dart';

class MoreResourcesView extends GetView<MoreResourcesController> {
  const MoreResourcesView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoreResourcesView'),
        centerTitle: true,
      ),

      body: const Center(
        child: Text(
          'MoreResourcesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
