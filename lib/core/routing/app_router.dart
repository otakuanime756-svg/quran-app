import 'package:flutter/material.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/mushaf/presentation/mushaf_page.dart';

class AppRouter {
  static const home = '/';
  static const mushaf = '/mushaf';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mushaf:
        return MaterialPageRoute(builder: (_) => const MushafPage());
      case home:
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
