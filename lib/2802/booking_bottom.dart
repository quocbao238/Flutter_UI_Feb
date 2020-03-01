import 'package:flutter/material.dart';

class BookingBottomTabs extends StatelessWidget {

  final IconData icon;
  final String text;
  final bool isSelected;
  final Function onPress;

  BookingBottomTabs(this.icon, this.text, this.isSelected, this.onPress);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 54.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(icon,size: 20.0,color: isSelected ? Colors.blue : Colors.white),
            SizedBox(height: 4.0),
            Text(
              text,
              style: TextStyle(
                fontSize: 10.0,
                color: isSelected ? Colors.blue : Colors.white,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
  
}
