
import 'package:flutter/material.dart';


extension Navigation on BuildContext {

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }


  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required bool predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}