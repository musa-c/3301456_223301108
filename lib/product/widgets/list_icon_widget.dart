import 'package:flutter/material.dart';

class ListIconWidget extends StatefulWidget {
  IconData icon;
  Color? color;
  int? count;
  Function? onTap;
  Function? onTapUser;

  ListIconWidget(
      {required this.icon,
      super.key,
      this.color,
      this.count,
      this.onTap,
      this.onTapUser});

  @override
  State<ListIconWidget> createState() => ListIconWidgetState();
}

class ListIconWidgetState extends State<ListIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 5, children: [
      InkWell(
        onTap: () => widget.onTap!() ?? () {},
        child: Icon(
          widget.icon,
          color: widget.color ?? _footerColor,
          size: 14,
        ),
      ),
      InkWell(
        onTap: () => widget.onTapUser!() ?? () {},
        child: _listIconText,
      )
    ]);
  }

  Color get _footerColor => const Color.fromRGBO(85, 90, 100, 1.0);

  Widget get _listIconText =>
      Text(widget.count.toString(), style: TextStyle(color: _footerColor));
}
