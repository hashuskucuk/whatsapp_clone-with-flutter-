//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorService {
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Future<dynamic> navigateTo(Widget route) {
    return _navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (BuildContext context) => route));
  }

  Future<dynamic> navigateToRaplace(Widget route) {
    return _navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => route));
  }
}
