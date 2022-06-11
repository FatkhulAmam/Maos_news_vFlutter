import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maos_news_flutter/core/app_provider.dart';
import 'package:maos_news_flutter/core/app_route.dart';
import 'package:maos_news_flutter/core/app_store_application.dart';
import 'package:maos_news_flutter/core/binding.dart';
import 'package:maos_news_flutter/core/env.dart';

class AppComponent extends StatelessWidget {
  final AppStoreApplication _application;

  AppComponent(this._application);

  @override
  Widget build(BuildContext context) {
    Get.log(Env.value.appName);

    final myApp = GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: Env.value.environmentType != EnvType.PRODUCTION,
      initialRoute: AppRoute.INITIAL,
      getPages: AppRoute.routes,
      defaultTransition: Transition.noTransition,
      initialBinding: AppBinding(),
      title: Env.value.appName,
    );

    final appProvider = AppProvider(
      application: _application,
      child: myApp,
    );
    return appProvider;
  }
}
