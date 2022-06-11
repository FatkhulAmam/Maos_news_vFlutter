import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_news_logic.dart';

class DetailNewsUi extends StatelessWidget {
  static const PATH = '/detail_news';
  final logic = Get.find<DetailNewsLogic>();
  final state = Get.find<DetailNewsLogic>().state;
  @override
  Widget build(BuildContext context) {

    return Container();
  }
}
