import 'package:flutter/material.dart';
import 'package:teste/model/menuIcon_model.dart';
import 'tabbar_widget.dart';

class RoundedTabbarWidget extends StatefulWidget {
  final List<Widget>? pages;
  final List<MenuIcon>? tabIcons;
  final Color? itemNormalColor;
  final Color? itemSelectedColor;
  final Color? tabBarBackgroundColor;
  final int selectedIndex;
  final Function? onTabItemIndexChanged;

  RoundedTabbarWidget({
    @required this.pages,
    @required this.tabIcons,
    this.onTabItemIndexChanged,
    this.tabBarBackgroundColor = Colors.black87,
    this.itemSelectedColor = Colors.yellow,
    this.itemNormalColor = Colors.yellow,
    this.selectedIndex = 0,
  });

  @override
  _RoundedTabbarWidgetState createState() => _RoundedTabbarWidgetState();
}

class _RoundedTabbarWidgetState extends State<RoundedTabbarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Widget> _pages;
  late List<MenuIcon> _tabIcons;

  late final Color _itemNormalColor;
  late final Color _itemSelectedColor;
  late final Color _tabBarBackgroundColor;

  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    //Check for pages length.
    _pages = widget.pages ?? [];
    _tabIcons = widget.tabIcons ?? [];
    _selectedIndex = widget.selectedIndex;
    _itemNormalColor = widget.itemNormalColor ?? Colors.yellow;
    _itemSelectedColor = widget.itemSelectedColor ?? Colors.yellow;
    _tabBarBackgroundColor = widget.tabBarBackgroundColor ?? Colors.black87;
    assert(
        _pages.length > 0 &&
            _pages.length < 16 &&
            _tabIcons.length == _pages.length,
        'Defina um número válido de páginas para guias. Você atribui o máximo. de 15 páginas e mínimo de 1.');
    _setupTabbarController();
  }

  void _setupTabbarController() {
    _tabController = new TabController(length: _pages.length, vsync: this);
    _tabController.index = _selectedIndex;
    _tabController.animation?.addListener(() => _animateTabbarOnScroll());
  }

  void _animateTabbarOnScroll() {
    final double _currentAnimationValue =
        _tabController.animation?.value ?? 0.0;
    final double _animationValue = (_currentAnimationValue * 10.0) - 10.0;
    final _modValue = ((_currentAnimationValue / 10) * 10).toInt();
    int _value = (_animationValue % 10).toInt().abs();

    if (_value == 5) {
      if (_modValue >= _tabController.index) {
        setState(() {
          _selectedIndex = _modValue + 1;
        });
      } else {
        setState(() {
          _selectedIndex = _modValue;
        });
      }
    }
    if (_tabController.indexIsChanging &&
        _tabController.previousIndex != _tabController.index) {
      if (widget.onTabItemIndexChanged != null) {
        widget.onTabItemIndexChanged!(_tabController.index);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            TabBarView(
              controller: _tabController,
              children: _pages,
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  TabbarWidget(
                    tabIcons: _tabIcons,
                    selectedIndex: _selectedIndex,
                    itemNormalColor: _itemNormalColor,
                    itemSelectedColor: _itemSelectedColor,
                    tabBarBackgroundColor: _tabBarBackgroundColor,
                    tabBarSelected: (int index) {
                      setState(() {
                        _tabController.index = index;
                        _selectedIndex = index;
                      });
                    },
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
              bottom: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
