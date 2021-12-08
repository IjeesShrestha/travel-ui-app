import 'package:flutter/material.dart';

import 'package:travel_ui_app/models/destination_model.dart';
import 'package:travel_ui_app/models/hotel_model.dart';
import 'package:travel_ui_app/screens/destination_screen.dart';
import 'package:travel_ui_app/screens/destinations_list.dart';
import 'package:travel_ui_app/screens/home_screen.dart';
import 'package:travel_ui_app/screens/hotels_screen.dart';
import 'package:travel_ui_app/screens/login_screen.dart';
import 'package:travel_ui_app/screens/registration_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(title: 'HomePage'),
        );

      case '/destinations_page':
        return MaterialPageRoute(
          builder: (_) => DestinationPage(args as Destination),
        );
      case '/destinations_list':
        return MaterialPageRoute(
          builder: (_) => const DestinationList(),
        );
      case '/hotels_page':
        return MaterialPageRoute(
          builder: (_) => HotelScreen(args as Hotel),
        );
      case '/login_screen':
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case '/registration_screen':
        return MaterialPageRoute(
          builder: (_) => const RegistrationScreen(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(child: Text('Error')),
      );
    });
  }
}
