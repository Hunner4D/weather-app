import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/presentation/screens/city_screen.dart';
import 'package:weather_app/presentation/screens/loading_screen.dart';
import 'package:weather_app/presentation/screens/location_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => LoadingScreen(),
        );
      case '/location':
        return MaterialPageRoute(
          builder: (_) => LocationScreen(),
        );
      case '/city':
        return MaterialPageRoute(
          builder: (_) => CityScreen(),
        );
      default:
        return null;
    }
  }
}
