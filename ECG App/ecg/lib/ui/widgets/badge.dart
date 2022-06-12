import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final Color badgeColor;
  const Badge({Key? key, required this.child, required this.badgeColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: badgeColor,
              radius: 5,
            ))
      ],
    );
  }
}
