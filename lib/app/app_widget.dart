import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/constants/theme.dart';
import 'package:teste/widgets/app_route_observer.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GAZIN DEVELOPER',
      theme: ThemeData(
        textTheme: TextTheme(
          subtitle1: TextStyle(
            color: Color(0xffE7E7E7),
            fontSize: 14,
          ),
        ),
        iconTheme:
            new IconThemeData(color: Colors.black, opacity: 1.0, size: 30.0),
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          color: Color(0xffEDEDED),
        ),
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: Color(0xff73879C),
            fontWeight: FontWeight.bold,
          ),
        ),
        primaryColor: TmPedeaki.primaryColor,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: Map<TargetPlatform,
                  _InanimatePageTransitionsBuilder>.fromIterable(
              TargetPlatform.values.toList(),
              key: (dynamic k) => k,
              value: (dynamic _) => const _InanimatePageTransitionsBuilder()),
        ),
      ),
      navigatorObservers: [
        //AppRouteObserver(),
        Modular.get<AppRouteObserver>(),
      ],
    ).modular();
  }
}

class _InanimatePageTransitionsBuilder extends PageTransitionsBuilder {
  const _InanimatePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return child;
  }
}
