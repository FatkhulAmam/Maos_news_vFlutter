import 'package:get/get.dart';

import 'home_page_state.dart';

class HomePageLogic extends GetxController {
  final HomePageState state = HomePageState();

  void onItemTapped(int index) {
    state.selectedIndex.value = index;
  }
}
