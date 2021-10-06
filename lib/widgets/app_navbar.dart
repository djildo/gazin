/*import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/model/menuIcon_model.dart';

class PinterestNavBar extends StatefulWidget {
  final Color backgroundColor;
  final Color darkThemeBackgroundColor;
  final Color selectedItemColor;
  final Color darkThemeselectedItemColor;
  final Color unselectedItemColor;
  final Color darkThemeUnselectedItemColor;
  final List<MenuIcon> items;
  final int currentIndex;
  final void Function(int) onTap;
  final Curve curve;

  const PinterestNavBar({
    Key? key,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.darkThemeBackgroundColor = const Color(0xFF292929),
    this.selectedItemColor = const Color(0xFF111111),
    this.darkThemeselectedItemColor = const Color(0xFFEFEFEF),
    this.unselectedItemColor = const Color(0xFF767676),
    this.darkThemeUnselectedItemColor = const Color(0xFF767676),
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.curve = Curves.easeInOut,
  }) : super(key: key);

  @override
  _PinterestNavBarState createState() => _PinterestNavBarState();
}

class _PinterestNavBarState extends State<PinterestNavBar> {
  double iconSize = 28;
  bool hovering = false;
  int hoveringItemIndex = -1;

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Brightness brightness = _theme.brightness;
    final BottomNavigationBarThemeData theme = _theme.bottomNavigationBarTheme;

    return Consumer<PinterestNavBarControllerState>(
      builder: (context, state, child) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          transform: Matrix4.translationValues(0, state.dy, 0),
          curve: widget.curve,
          child: child!,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: brightness == Brightness.light
                ? theme.backgroundColor ?? widget.backgroundColor
                : theme.backgroundColor ?? widget.darkThemeBackgroundColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(0, .5),
                blurRadius: .1,
                spreadRadius: .05,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < widget.items.length; i++)
                  InkWell(
                    onTap: () {
                      widget.onTap(i);
                    },
                    onHover: (h) {
                      setState(() {
                        hovering = h;
                        hoveringItemIndex = i;
                      });
                    },
                    child: SizedBox(
                      //width: iconSize * 2,
                      height: iconSize * 2,
                      child: Row(
                        children: [
                          Icon(
                            widget.items[i].icone,
                            size: hovering
                                ? hoveringItemIndex == i
                                    ? iconSize * 1.4
                                    : iconSize
                                : iconSize,
                            color: widget.currentIndex == i
                                ? brightness == Brightness.light
                                    ? theme.selectedItemColor ??
                                        widget.selectedItemColor
                                    : theme.selectedItemColor ??
                                        widget.darkThemeselectedItemColor
                                : brightness == Brightness.light
                                    ? theme.unselectedItemColor ??
                                        widget.unselectedItemColor
                                    : theme.unselectedItemColor ??
                                        widget.darkThemeUnselectedItemColor,
                          ),
                          if (widget.items[i].id != 1)
                            Text(widget.items[i].titulo),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PinterestNavBarControllerState extends ChangeNotifier {
  double dy = 0;

  ScrollUpdateNotification? _notification;
  ScrollUpdateNotification? get notification => _notification;

  set notification(ScrollUpdateNotification? value) {
    _notification = value;

    // print('notification axis direction ${value?.metrics.axisDirection}');
    // print('notification axis ${value?.metrics.axis}');
    // print('notification scrollDelta ${value?.scrollDelta?.sign}');
    // print('dy is $dy');

    if (dy == 0 &&
        (value?.metrics.axis == Axis.vertical &&
            value?.scrollDelta?.sign == 1)) {
      dy = 150;
      notifyListeners();
    } else if (dy == 150 &&
        (value?.metrics.axis == Axis.horizontal ||
            value?.scrollDelta?.sign == -1)) {
      dy = 0;
      notifyListeners();
    }
  }
}

/// Wrap your MaterialApp widget with this
/// This widget tells the [PinterestNavBar] when to hide/show transition
class PinterestNavBarController extends StatelessWidget {
  final Widget child;

  const PinterestNavBarController({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PinterestNavBarControllerState>(
      create: (_) => PinterestNavBarControllerState(),
      child: Builder(builder: (context) {
        return NotificationListener<ScrollUpdateNotification>(
          onNotification: (notification) {
            context.read<PinterestNavBarControllerState>().notification =
                notification;

            return true;
          },
          child: child,
        );
      }),
    );
  }
}
*/
