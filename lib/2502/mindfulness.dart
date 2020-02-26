import 'package:flutter/material.dart';
import 'package:flutter_feb/2402/b_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'mindbottom.dart';
import 'mindpage1.dart';
import 'mindpage2.dart';

class B_MindFulnessOne extends StatefulWidget {
  @override
  _B_MindFulnessOneState createState() => _B_MindFulnessOneState();
}

class _B_MindFulnessOneState extends State<B_MindFulnessOne> {
  /* List Widget */
  List<Widget> pages;

  /* Text */
  final String _txtWelcome = "Welcome, Chris";
  final String _txtDate = "28 february, 2020";
  final String _txtActivity = "Activities today";
  final String _txtTime = "8:00 pm";
  final String _txtQues = "What do you need today?";
  final String _txtmeditation = "Meditation and relaxation";

  /* Size */
  final double padding = 16.0;
  final double radius = 16.0;

  /* Color */
  final Color _botomColor = Color.fromRGBO(40, 40, 77, 1);
  final Color _listColor = Color.fromRGBO(196, 210, 193, 1).withOpacity(0.2);
  final Color _topcontainerColor = Colors.white.withOpacity(0.8);
  final Color _cltxt = Colors.white;
  final Color _cltxtOrange = Colors.deepOrange[600];

  /* Page Controller */
  PageController _pageController;

  /* Page view Index */
  int selectedIndex = 0;

  /* Bottom tab index*/
  int currentIndex = 0;

  /* Bottom Tab Funtion */
  void _onPress(int num) {
    setState(() {
      currentIndex = num;
      print("currentIndex ${currentIndex}");
    });
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: selectedIndex,
      viewportFraction: 0.85,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _definePages();
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //PageView
          Positioned.fill(
            child: pages[currentIndex],
          ),

          // BotomNvigator
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: padding, right: padding),
              height: _height / 12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius)),
                  color: _botomColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MindBottom(FontAwesomeIcons.home, currentIndex == 0, () {
                    _onPress(0);
                  }),
                  MindBottom(FontAwesomeIcons.moon, currentIndex == 1, () {
                    _onPress(1);
                  }),
                  MindBottom(FontAwesomeIcons.user, currentIndex == 2, () {
                    _onPress(2);
                  }),
                ],
              ),
            ),
          )
        ],

        //
      ),
    );
  }

  _definePages() {
    pages = [
      MindPage1(),
      MindPage2(),
      Container(
        child: Center(
          child: Text("Loading.....",style: TextStyle(color: Colors.red,fontSize: 40.0),),
        ),
      )
    ];
  }
}

// Container(
//                   margin: EdgeInsets.only(top: padding / 2),
//                   height: _height / 12,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(radius),
//                           topRight: Radius.circular(radius)),
//                       color: _botomColor),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Icon(Icons.home, size: 30.0, color: Colors.white),
//                       Icon(Icons.home, size: 30.0, color: Colors.white),
//                       Icon(Icons.home, size: 30.0, color: Colors.white),
//                     ],
//                   ),
//                 ),
