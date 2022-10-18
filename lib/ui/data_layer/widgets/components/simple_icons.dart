import 'package:flutter/material.dart';
import 'package:missa/common/utils.dart';

// ignore: must_be_immutable
class SimpleIcon extends StatelessWidget {
  SimpleIcon({Key? key, this.icon, this.color = Colors.white, this.size = 25.0})
      : super(key: key);

  dynamic icon;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.0,
      height: 55.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: accentColor,
      ),
      child: Center(
        child: icon is IconData
            ? Icon(icon, color: color, size: size)
            : Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(icon,
                    width: size, height: size, fit: BoxFit.fill, color: color)),
      ),
    );
  }
}
