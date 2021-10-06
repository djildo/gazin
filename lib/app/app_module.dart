import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/app_store.dart';
import 'package:teste/app/modules/dashboard/dashboard_store.dart';
import 'package:teste/widgets/app_route_observer.dart';

import 'modules/home/home_module.dart';
import 'modules/inicial/inicial_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => AppRouteObserver()),
    Bind.lazySingleton((i) => AppStore()),
    Bind.lazySingleton((i) => InicialStore()),
    Bind.lazySingleton((i) => IndexStore()),
    Bind.lazySingleton((i) => DashboardStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    //ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/', module: HomeModule()),
  ];
}
