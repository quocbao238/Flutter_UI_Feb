import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MindBottom extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Function onPressed;
  final Color _cltxtOrange = Colors.deepOrange[600];

  MindBottom(this.icon, this.isSelected, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 120.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //icon
            // SizedBox(height: 4.0),
            Icon(icon,
                size: 24.0, color: isSelected ? _cltxtOrange : Colors.white),
            Text(
              isSelected ? "." : "",
              style: TextStyle(
                fontSize: 14.0,
                color: isSelected ? _cltxtOrange : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
