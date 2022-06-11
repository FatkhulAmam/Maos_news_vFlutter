import 'package:get/get.dart';
import 'package:maos_news_flutter/utility/shared/service/storage_service.dart';

class DependencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
  }
}