import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_screen_logic.dart';

class SplashScreenUi extends StatelessWidget {
  static const String PATH = '/splash_screen';
  final logic = Get.find<SplashScreenLogic>();
  final state = Get.find<SplashScreenLogic>().state;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: const Center(
        child: Text('Maos News'),
      ),
    );
  }
}
