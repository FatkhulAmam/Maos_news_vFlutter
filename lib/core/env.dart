


import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:maos_news_flutter/core/app_component.dart';
import 'package:maos_news_flutter/core/dependency_injection.dart';

import 'app_store_application.dart';

enum EnvType {
  DEVELOPMENT,
  STAGING,
  PRODUCTION,
  TESTING
}

class Env {
  static late Env value;

  late String appName;
  late String baseUrl;
  EnvType environmentType = EnvType.DEVELOPMENT;

  Env() {
    value = this;
    _init();
  }

  void _init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await DependencyInjection.init();
    var application = AppStoreApplication();
    await application.onCreate();
    runApp(AppComponent(application));
  }
}
