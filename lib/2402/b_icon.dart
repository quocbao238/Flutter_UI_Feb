import 'package:flutter/material.dart';

class IconCustom extends StatelessWidget {
  final size;
  final urlIcon;
  final Color color;

  IconCustom(this.urlIcon, this.size, this.color);
  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Container(
        child: Image(
          image: AssetImage(
            'assets/2402/$urlIcon',
          ),
          fit: BoxFit.cover,
          color: color,
        ),
        width: size,
      ),
    );
  }
}
