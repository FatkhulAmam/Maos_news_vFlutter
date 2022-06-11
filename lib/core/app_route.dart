import 'package:get/get.dart';
import 'package:maos_news_flutter/features/presentation/home_page/detail_news/detail_news_binding.dart';
import 'package:maos_news_flutter/features/presentation/home_page/detail_news/detail_news_ui.dart';
import 'package:maos_news_flutter/features/presentation/home_page/home_page_binding.dart';
import 'package:maos_news_flutter/features/presentation/home_page/home_page_ui.dart';
import 'package:maos_news_flutter/features/presentation/login_page/login_page_binding.dart';
import 'package:maos_news_flutter/features/presentation/login_page/login_page_ui.dart';
import 'package:maos_news_flutter/features/presentation/splash_screen/splash_screen_binding.dart';
import 'package:maos_news_flutter/features/presentation/splash_screen/splash_screen_ui.dart';

class AppRoute {
  static const INITIAL = SplashScreenUi.PATH;

  static final routes = [
    GetPage(
      name: SplashScreenUi.PATH,
      page: () => SplashScreenUi(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: LoginPageUi.PATH,
      page: () => LoginPageUi(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: HomePageUi.PATH,
      page: () => HomePageUi(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: DetailNewsUi.PATH,
      page: () => DetailNewsUi(),
      binding: DetailNewsBinding(),
    ),
  ];
}
