import 'package:flutter/material.dart';
import 'package:flutter_feb/2402/b_icon.dart';

class MindPage1 extends StatefulWidget {
  @override
  _MindPage1State createState() => _MindPage1State();
}

class _MindPage1State extends State<MindPage1> {
  /* Text */
  final String _txtWelcome = "Welcome, Chris";
  final String _txtDate = "28 february, 2020";
  final String _txtActivity = "Activities today";
  final String _txtTime = "8:00 pm";
  final String _txtQues = "What do you need today?";
  final String _txtmeditation = "Meditation and relaxation";
  final String _txtname_meditation = "Meditation Zen";
  final String _txtmeditation_description = "Recommended in Morning";

  /* Size */
  final double padding = 16.0;
  final double radius = 16.0;

  /* Color */
  final Color _botomColor = Color.fromRGBO(40, 40, 77, 1);
  final Color _listColor = Color.fromRGBO(196, 210, 193, 1).withOpacity(0.2);
  final Color _topcontainerColor = Colors.white.withOpacity(0.8);
  final Color _cltxt = Colors.white;
  final Color _cltxtOrange = Colors.deepOrange[600];

  final List<String> list_icon = <String>[
    'assets/2502/zenicon.png',
    'assets/2502/moonicon.png',
    'assets/2502/morningicon.png'
  ];
  final List<String> list_programing_name = <String>[
    'Meditation Zen',
    'Bedtime',
    'Getup'
  ];
  final List<String> list_programing_descrip = <String>[
    'Recommended in Morning',
    'Recommended in Evening',
    'Recommended in Morning'
  ];

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        //Backgorund
        Positioned.fill(
            child: Image.asset('assets/2502/back2.jpg', fit: BoxFit.fill)),

        //Page VIew
        Positioned.fill(
          child: SafeArea(
            top: true,
            left: true,
            right: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Welcome
                Container(
                  margin: EdgeInsets.only(top: padding * 3),
                  padding: EdgeInsets.symmetric(horizontal: padding * 2),
                  height: _height / 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _txtWelcome,
                        style: TextStyle(
                          color: _cltxt,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: padding / 2),
                      Text(
                        _txtDate,
                        style: TextStyle(
                            color: _cltxt,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),

                // Activity
                Container(
                  margin: EdgeInsets.only(
                      top: padding, right: padding * 2, left: padding * 2),
                  padding: EdgeInsets.all(padding),
                  height: _height / 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: _topcontainerColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      // Activity & time
                      Row(
                        children: <Widget>[
                          Container(
                            height: 24.0,
                            width: 24.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius * 3),
                                color: _cltxtOrange),
                            child: Icon(
                              Icons.add_alert,
                              size: 12.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: padding / 2),
                          Text(
                            _txtActivity,
                            style:
                                TextStyle(fontSize: 18.0, color: _cltxtOrange),
                          ),
                          Spacer(),
                          Text(
                            _txtTime,
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.0),
                      //Meditation
                      Text(
                        _txtmeditation,
                        style:
                            TextStyle(fontSize: 18.0, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                //  What do you need today
                Spacer(),
                Container(
                  margin:
                      EdgeInsets.only(bottom: padding * 6, left: padding * 2),
                  height: _height / 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: (_height / 4) * 1.5 / 4,
                        child: Text(
                          _txtQues,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3,
                              fontSize: 22.0),
                        ),
                      ),
                      Container(
                        height: (_height / 4) * 2.5 / 4,
                        child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          // padding: EdgeInsets.only(right: padding / 2),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: (_width * 3 / 4),
                              margin: EdgeInsets.only(right: padding),
                              padding:
                                  EdgeInsets.symmetric(horizontal: padding),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(radius),
                                  color: _listColor),
                              child: Row(
                                children: <Widget>[
                                  IconCustom(list_icon[index], 50.0,
                                      Colors.white),
                                  SizedBox(
                                    width: padding,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        list_programing_name[index],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: padding / 4,
                                      ),
                                      Text(
                                        list_programing_descrip[index],
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // NavigatorBottom
              ],
            ),
          ),
        ),
      ],
    );
  }
}
