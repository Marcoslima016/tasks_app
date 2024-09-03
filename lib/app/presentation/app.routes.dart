import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../app.exports.dart';

abstract mixin class AppScreen {
  String get screenTag;
}

abstract class IAppRoutes {
  List<AppScreen> get pages;

  Route generateRoute(RouteSettings settings);

  Widget getScreen(RouteSettings settings);
}

class AppRoutes extends IAppRoutes {
  //

  @override
  List<AppScreen> pages = [
    const TasksScreen(),
    const CreateTaskScreen(),
  ];

  /// Gera a rota referente a uma chamada feita
  @override
  Route generateRoute(RouteSettings settings) {
    final screen = getScreen(settings);
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => screen,
    );
  }

  // Recupera a tela de uma rota
  @override
  Widget getScreen(RouteSettings settings) {
    for (AppScreen page in pages) {
      if (settings.name == page.screenTag) {
        return page as Widget;
      }
    }
    return Container();
  }
}

class RouteManager extends NavigatorObserver {
  final Map<String, Scope> _scopes = {};

  Scope getScope(String routeName) {
    return _scopes[routeName] ??= Scope(routeName: routeName);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      getScope(route.settings.name!);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      _scopes.remove(route.settings.name!);
    }
  }
}

class Scope {
  final GetIt getIt = GetIt.asNewInstance();
  final String routeName;
  Scope({required this.routeName});
}
