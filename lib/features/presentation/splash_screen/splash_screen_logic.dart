import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:maos_news_flutter/features/presentation/login_page/login_page_ui.dart';

import 'splash_screen_state.dart';

class SplashScreenLogic extends GetxController {
  final SplashScreenState state = SplashScreenState();
  
  @override
  void onInit(){
    super.onInit();
    FlutterNativeSplash.remove();
  }
  
  @override
  onReady() async {
    super.onReady();
    await Future.delayed(const Duration(seconds: 2));

    Get.offAllNamed(LoginPageUi.PATH);
}
  
}
