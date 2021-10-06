import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:teste/app/modules/clientes/clientes_page.dart';
import 'package:teste/app/modules/inicial/inicial_page.dart';
import 'app_tab.dart';
import 'package:teste/model/menuIcon_model.dart';
import 'package:teste/app/app_store.dart';
import 'app_drawer.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({required this.body, required this.pageTitle, Key? key})
      : super(key: key);

  final Widget body;

  final String pageTitle;

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends ModularState<AppScaffold, AppStore> {
  int _indexTab = 1;
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    //final bool displayMobileLayout = MediaQuery.of(context).size.width < 950;
    return Row(
      children: [
        /*if (!displayMobileLayout)
          const AppDrawer(
            permanentlyDisplay: true,
          ),*/
        Expanded(
          child: Scaffold(
            key: _drawerKey,
            backgroundColor: Color(0xffF5F6F5),
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title: Text(widget.pageTitle),
              iconTheme: IconThemeData(color: Color(0xff313945)),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton:
                ScopedBuilder<AppStore, Exception, List<MenuIcon>>(
              store: store,
              onState: (_, lista) {
                List<Widget> tela = [];
                lista.forEach((e) {
                  if (e.tela != null) tela.add(e.tela!);
                });

                _indexTab = Modular.get<IndexStore>().state;

                return RoundedTabbarWidget(
                  itemNormalColor: Colors.lightBlue[300],
                  itemSelectedColor: Colors.lightBlue[900],
                  tabBarBackgroundColor: Colors.lightBlue[100],
                  tabIcons: lista,
                  pages: tela,
                  selectedIndex: _indexTab,
                  onTabItemIndexChanged: (int index) {
                    if (index == 0) {
                      _indexTab = index;
                      _drawerKey.currentState!.openDrawer();
                    } else {
                      _indexTab = index;
                    }
                  },
                );
              },
              onError: (context, error) => Center(
                child: Text(
                  'Erro ao carregar Menu, tente novamente. :)',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              onLoading: (context) => Center(
                child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              ),
            ),
            drawer: const AppDrawer(
              permanentlyDisplay: false,
            ),
            body: widget.body,
          ),
        )
      ],
    );
  }
}
