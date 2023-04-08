import 'package:flutter/material.dart';

class ListIconWidget extends StatefulWidget {
  IconData icon;
  Color? color;
  ListIconWidget({required this.icon, super.key, this.color});

  @override
  State<ListIconWidget> createState() => ListIconWidgetState();
}

class ListIconWidgetState extends State<ListIconWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Wrap(spacing: 5, children: [
        Icon(
          widget.icon,
          color: widget.color ?? _footerColor,
          size: 14,
        ),
        _listIconText
      ]),
    );
  }

  Color get _footerColor => const Color.fromRGBO(85, 90, 100, 1.0);

  Widget get _listIconText =>
      Text("121", style: TextStyle(color: _footerColor));
}
