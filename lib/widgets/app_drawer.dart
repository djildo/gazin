import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/app_store.dart';
import 'package:teste/constants/theme.dart';
import 'package:teste/data/menu_data.dart';
import 'package:teste/model/menuIcon_model.dart';
import 'package:teste/model/menu_model.dart';

import 'app_route_observer.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({required this.permanentlyDisplay, Key? key})
      : super(key: key);

  final bool permanentlyDisplay;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with RouteAware {
  late String _selectedRoute;
  var _routeObserver;

  @override
  void initState() {
    super.initState();
    _routeObserver = AppRouteObserver();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    _routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    _updateSelectedRoute();
  }

  @override
  void didPop() {
    _updateSelectedRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: TmPedeaki.menuColor,
        child: Drawer(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: TmPedeaki.menuColor,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 130,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: Image.network(
                                    "https://colorlib.com/polygon/gentelella/images/img.jpg",
                                    width: 56,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  child: Stack(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text('Bem vindo',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xffBAB8B8))),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 48,
                                          ),
                                          Text(
                                            'ILDO E SANTO',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffECF0F1)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xff2A3F54),
                        ),
                      ),
                      for (var i = 0; i < listaMenu.length; i++)
                        ListTileTheme(
                          iconColor: Color(0xffE7E7E7),
                          child: ListTile(
                            leading: Icon(listaMenu[i].icone),
                            title: Text(
                              listaMenu[i].titulo,
                            ),
                            onTap: () async {
                              if (listaMenu[i].rota != null)
                                await _navigateTo(
                                    context, listaMenu[i].rota!, listaMenu[i]);
                            },
                            selected: _selectedRoute == listaMenu[i].rota!,
                          ),
                        ),
                      ListTileTheme(
                        iconColor: Color(0xffE7E7E7),
                        child: ListTile(
                          leading: const Icon(Icons.logout),
                          title: const Text(
                            "Logout",
                          ),
                          onTap: () async {
                            Modular.to.navigate('../');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.permanentlyDisplay)
                const VerticalDivider(
                  width: 1,
                )
            ],
          ),
        ));
  }

  Future<void> _navigateTo(
      BuildContext context, String routeName, MenuIes menu) async {
    Navigator.pop(context);
    List<MenuIcon> _lista = Modular.get<AppStore>().state;
    final tela = _lista.where((element) => element.id == menu.id);

    if (tela.isEmpty && menu.tela != null) {
      await Modular.get<AppStore>().increment(menu);
    } else {
      List<MenuIcon> x = tela.toList();
      await Modular.get<AppStore>().atualiza(x[0].idx);
    }
  }

  void _updateSelectedRoute() {
    setState(() {
      _selectedRoute = ModalRoute.of(context)!.settings.name!;
    });
  }
}
