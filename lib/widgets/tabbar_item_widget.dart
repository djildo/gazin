import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/app_store.dart';

class TabbarItemWidget extends StatefulWidget {
  late final bool isSelected;
  late final IconData icon;
  final Function? onItemPressed;
  late final Color itemNormalColor;
  late final Color itemSelectedColor;
  late final Color itemBackgroundColor;
  late final String? titulo;
  late final int? idx;

  TabbarItemWidget({
    required this.isSelected,
    required this.icon,
    this.onItemPressed,
    required this.itemBackgroundColor,
    required this.itemSelectedColor,
    required this.itemNormalColor,
    this.titulo,
    this.idx,
  });
  @override
  _TabbarItemWidgetState createState() => _TabbarItemWidgetState();
}

class _TabbarItemWidgetState extends State<TabbarItemWidget> {
  @override
  Widget build(BuildContext context) {
    final _backgroundColor = widget.itemSelectedColor;
    final _iconColor = (widget.isSelected == false)
        ? widget.itemNormalColor
        : widget.itemBackgroundColor;
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: widget.isSelected == true ? _backgroundColor : null,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    widget.icon,
                    color: _iconColor,
                  ),
                  onPressed: () {
                    if (widget.onItemPressed != null) {
                      widget.onItemPressed!();
                    }
                  },
                ),
                if (widget.titulo != null && widget.isSelected == true)
                  Text(
                    widget.titulo!,
                    style: TextStyle(
                      color: _iconColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (widget.idx! > 1)
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () async {
                await Modular.get<AppStore>().fechar(widget.idx!);
              },
              child: Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: BoxConstraints(
                  minWidth: 12,
                  minHeight: 12,
                ),
                child: Text(
                  'X',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
