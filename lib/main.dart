import 'package:maos_news_flutter/core/env.dart';

void main() => Production();

class Production extends Env {
  final String appName = 'Maos News';
  final String baseUrl = 'http://localhost:8800';
  EnvType environmentType = EnvType.PRODUCTION;
}