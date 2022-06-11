import 'package:get/get.dart';

import 'detail_news_logic.dart';

class DetailNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailNewsLogic());
  }
}
