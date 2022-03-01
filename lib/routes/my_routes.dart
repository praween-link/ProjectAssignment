import 'package:flutter/material.dart';
import 'package:myassigment/views/add/app_product.dart';
import 'package:myassigment/views/home_screen.dart';
import 'package:myassigment/views/login/login_screen.dart';
import 'package:myassigment/views/login/registration.dart';

class MyRoutes {
  static route(
          {required RouteSettings routeSettings}) =>
      MaterialPageRoute<void>(
        settings: routeSettings,
        builder: (BuildContext context) {
          switch (routeSettings.name) {
            case LoginScreen.routeName:
              return const LoginScreen();
            case Registration.routeName:
              return const Registration();
            case HomeScreen.routeName:
              return const HomeScreen();
            case AddProduct.routeName:
              return const AddProduct();
            default:
              return const LoginScreen();
          }
        },
      );
}
