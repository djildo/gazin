import 'package:flutter/material.dart';
import 'package:teste/model/menuIcon_model.dart';
import 'tabbar_item_widget.dart';

class TabbarWidget extends StatefulWidget {
  final int selectedIndex;
  late final Color itemNormalColor;
  late final Color itemSelectedColor;
  late final Color tabBarBackgroundColor;
  final Function? tabBarSelected;
  final List<MenuIcon> tabIcons;
  TabbarWidget({
    this.selectedIndex = 0,
    this.tabBarSelected,
    required this.tabBarBackgroundColor,
    required this.itemSelectedColor,
    required this.itemNormalColor,
    required this.tabIcons,
  });
  @override
  _TabbarWidgetState createState() => _TabbarWidgetState();
}

class _TabbarWidgetState extends State<TabbarWidget> {
  late int _selectedTabbarMenuIndex;
  late List<MenuIcon> _tabIcons;
  final double _defaultHorizontalPadding = 20.0;

  @override
  void initState() {
    super.initState();
    _selectedTabbarMenuIndex = widget.selectedIndex;
    _tabIcons = widget.tabIcons;
  }

  void _onTabItemPressed({required int tabItemIndex}) {
    setState(() {
      _selectedTabbarMenuIndex = tabItemIndex;
      if (widget.tabBarSelected != null) {
        widget.tabBarSelected!(tabItemIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _selectedTabbarMenuIndex = widget.selectedIndex;
    final double _maxWidth = MediaQuery.of(context).size.width;
    double _containerWidth = _maxWidth - (_defaultHorizontalPadding * 2.0);
    _containerWidth = (_containerWidth > 480.0) ? 480.0 : _containerWidth;

    return Container(
      constraints: BoxConstraints(maxHeight: 70.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: widget.tabBarBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.90),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _getTabbarItems(),
        ),
      ),
    );
  }

  List<Widget> _getTabbarItems() {
    List<Widget> _tabItems = [];
    for (var i = 0; i < _tabIcons.length; i++) {
      final _tabItem = TabbarItemWidget(
        itemBackgroundColor: widget.tabBarBackgroundColor,
        itemNormalColor: widget.itemNormalColor,
        itemSelectedColor: widget.itemSelectedColor,
        isSelected: (_selectedTabbarMenuIndex == i),
        icon: _tabIcons[i].icone,
        onItemPressed: () => _onTabItemPressed(
          tabItemIndex: i,
        ),
        titulo: _tabIcons[i].titulo,
        idx: i,
      );
      _tabItems.add(_tabItem);
    }
    return _tabItems;
  }
}
