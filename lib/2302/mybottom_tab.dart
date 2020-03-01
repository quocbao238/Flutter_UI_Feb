import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyBottomTabs extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final Function onPressed;

  MyBottomTabs(this.icon, this.text, this.isSelected, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
          child: Container(
        width: 64.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //icon
            Icon(icon, size: 24.0, color: isSelected ? Colors.black : Colors.grey),
            SizedBox(height: 4.0),
            //text
            Text(
              text,
              style: TextStyle(
                fontSize: 12.0,
                color: isSelected ? Colors.black : Colors.grey,
                // fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
