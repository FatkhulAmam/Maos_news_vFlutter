import 'package:get/get.dart';
import 'package:maos_news_flutter/features/presentation/home_page/home_page_ui.dart';

import 'login_page_state.dart';

class LoginPageLogic extends GetxController {
  final LoginPageState state = LoginPageState();

  onRequestLogin() {
    Get.toNamed(HomePageUi.PATH);
  }
}
