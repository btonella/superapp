import 'package:flutter/material.dart';

/// Utilize no lugar da classe [Navigator]
///
/// ex: **AppNavigator.navigatorState.pushNamed("routeName")**
class AppNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState get navigatorState => navigatorKey.currentState!;
}
