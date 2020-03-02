import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class More {
  IconData icon;
  String name;
  More({this.icon, this.name});
}

List<More> bookingmores = [
  More(
    icon: Icons.chrome_reader_mode,
    name: "My coupon codes",
  ),
  More(
    icon: Icons.card_giftcard,
    name: "Gift cards",
  ),
  More(
    icon: Icons.done_all,
    name: "Deals",
  ),
  More(
    icon: Icons.add_circle_outline,
    name: "List your property",
  ),
  More(
    icon: FontAwesomeIcons.car,
    name: "Car rentals",
  ),
  More(
    icon: Icons.card_travel,
    name: "Travel articles",
  ),
  More(
    icon: Icons.group_work,
    name: "Travel communitites",
  ),
  More(
    icon: Icons.photo_filter,
    name: "Genius Loyalty Programer",
  ),
  More(
    icon: Icons.message,
    name: "Rate your stay",
  ),
  More(
    icon: FontAwesomeIcons.heart,
    name: "Lists",
  ),
  More(
    icon: Icons.settings,
    name: "Settings",
  ),
  More(
    icon: FontAwesomeIcons.servicestack,
    name: "Customer Service help",
  ),
  More(
    icon: Icons.phone_iphone,
    name: "Give app feedback",
  ),
];
